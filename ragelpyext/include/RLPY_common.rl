%%{
    machine RLPY_common;

    # TODO this should be `Py_UCS4` but ragel does not allow it
    alphtype unsigned int;
    getkey PyUnicode_ReadChar(data, p);
}%%
