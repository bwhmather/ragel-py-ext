%%{
    machine RLPY_common;

    access rlpy_state.;

    variable p rlpy_state.p;
    variable pe rlpy_state.pe;
    variable eof rlpy_state.eof;

    # XXX this should be `Py_UCS4` but ragel does not allow it
    alphtype unsigned int;
    getkey PyUnicode_ReadChar(data, rlpy_state.p);
}%%
