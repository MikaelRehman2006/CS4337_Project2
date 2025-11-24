
cell(Maze, R, C, Value) :-
    nth0(R, Maze, Row),
    nth0(C, Row, Value).

delta(left,  0, -1).
delta(right, 0,  1).
delta(up,   -1, 0).
delta(down,  1, 0).

move(R, C, Action, R2, C2) :-
    delta(Action, DR, DC),
    R2 is R + DR,
    C2 is C + DC.
