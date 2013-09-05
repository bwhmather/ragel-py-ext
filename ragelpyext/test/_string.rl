#include <Python.h>
#include <unicodeobject.h>

#include <RLPY.h>

static PyObject *
py_parse_cstring(PyObject *self, PyObject *args);

%%{
    machine cstring;
    include RLPY_common "RLPY_common.rl";
    include RLPY_string "RLPY_string.rl";

    main := RLPY_cstring;
}%%

%% write data;

static PyObject *
py_parse_cstring(PyObject *self, PyObject *args)
{
    PyObject *string = NULL;

    PyObject *data;
    RLPY_state rlpy_state = {};

    int err = PyArg_ParseTuple(args, "U", &data);
    if (!err) {
        return NULL;
    }

    rlpy_state.pe = PyUnicode_GET_LENGTH(data);
    rlpy_state.eof = rlpy_state.pe;


    %% write init;
    %% write exec;

    if (string == NULL) {
        string = Py_False;
        Py_INCREF(string);
    }

    return string;
}

static PyMethodDef testmethods[] = {
    {"parse_cstring",
        (PyCFunction)py_parse_cstring,
        METH_VARARGS,
        ""},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef testmodule = {
    PyModuleDef_HEAD_INIT,
    "ragelpyext.test._string",
    "",
    -1,
    testmethods
};

PyMODINIT_FUNC
PyInit__string(void)
{
    return PyModule_Create(&testmodule);
}


