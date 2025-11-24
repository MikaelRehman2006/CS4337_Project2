
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


valid_cell_symbol(f).
valid_cell_symbol(w).
valid_cell_symbol(s).
valid_cell_symbol(e).

valid_symbols([]).
valid_symbols([Row|Rest]) :-
    valid_row_symbols(Row),
    valid_symbols(Rest).

valid_row_symbols([]).
valid_row_symbols([H|T]) :-
    valid_cell_symbol(H),
    valid_row_symbols(T).


valid_row_lengths([]).
valid_row_lengths([_]).
valid_row_lengths([Row1, Row2 | Rest]) :-
    length(Row1, L),
    length(Row2, L),
    valid_row_lengths([Row2 | Rest]).



find_all_starts(Maze, Starts) :-
    findall((R,C),
        (nth0(R, Maze, Row),
         nth0(C, Row, s)),
    Starts).


exactly_one_start(Maze) :-
    find_all_starts(Maze, Starts),
    length(Starts, 1).


valid_maze(Maze) :-
    valid_symbols(Maze),
    valid_row_lengths(Maze),
    exactly_one_start(Maze).