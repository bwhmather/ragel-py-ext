%%{
    machine RLPY_string;

    action _RLPY_begin_cstring {
        rlpy_state.ts = rlpy_state.p;
    }

    action _RLPY_end_cstring {
        string = PyUnicode_Substring(data, rlpy_state.ts, rlpy_state.p);
    }


    RLPY_cstring = '"'
        (((('\\' any) | /[^"]/)*) > _RLPY_begin_cstring % _RLPY_end_cstring)
        '"';
}%%
