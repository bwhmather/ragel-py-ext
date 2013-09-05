typedef struct {
    int p;
    int pe;
    int eof;

    int *stack;
    int top;
    int act;

    int ts;
    int te;

    int cs;
} RLPY_state;

