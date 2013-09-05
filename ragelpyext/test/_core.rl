#include <Python.h>
#include <RLPY.h>

static PyObject *
py_is_hello(PyObject *self, PyObject *args);

%%{
    machine hello;
    include RLPY_common "RLPY_common.rl";

    action found_hello { 
        is_hello = Py_True;
    }

    main := "hello" > found_hello;
}%%

%% write data;

static PyObject *
py_is_hello(PyObject *self, PyObject *args)
{
    PyObject *is_hello = Py_False;

    // The python string to parse (required by ragel)
    PyObject *data;
    RLPY_state rlpy_state = {};

    int err = PyArg_ParseTuple(args, "U", &data);
    if (!err) {
        return NULL;
    }

    // start and end offsets in data string
    rlpy_state.pe = PyUnicode_GET_LENGTH(data);
    rlpy_state.eof = rlpy_state.pe;

    %% write init;
    %% write exec;

    Py_INCREF(is_hello);
    return is_hello;
}

static PyMethodDef testmethods[] = {
    {"is_hello",
        (PyCFunction) py_is_hello,
        METH_VARARGS,
        ""},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef testmodule = {
    PyModuleDef_HEAD_INIT,
    "ragelpyext.test._core",
    "",
    -1,
    testmethods
};

PyMODINIT_FUNC
PyInit__core(void)
{
    return PyModule_Create(&testmodule);
}


