
cell(Maze, R, C, Value) :-
    nth0(R, Maze, Row),
    nth0(C, Row, Value).

valid_cell_symbol(w).
valid_cell_symbol(f).
valid_cell_symbol(s).
valid_cell_symbol(e).

delta(left,  0, -1).
delta(right, 0,  1).
delta(up,   -1,  0).
delta(down,  1,  0).

move(R, C, Action, R2, C2) :-
    delta(Action, DR, DC),
    R2 is R + DR,
    C2 is C + DC.

valid_row_symbols([]).
valid_row_symbols([H|T]) :-
    valid_cell_symbol(H),
    valid_row_symbols(T).

valid_row_lengths([]).
valid_row_lengths([_]).
valid_row_lengths([A,B|Rest]) :-
    length(A, L),
    length(B, L),
    valid_row_lengths([B|Rest]).

find_all_starts(Maze, Starts) :-
    findall((R,C),
       ( nth0(R, Maze, Row),
         nth0(C, Row, s)
       ),
       Starts).

exactly_one_start(Maze) :-
    find_all_starts(Maze, Starts),
    length(Starts, 1).

valid_symbols([]).
valid_symbols([Row|Rest]) :-
    valid_row_symbols(Row),
    valid_symbols(Rest).

valid_maze(Maze) :-
    Maze \= [],
    valid_symbols(Maze),
    valid_row_lengths(Maze),
    exactly_one_start(Maze).


find_start(Maze, R, C) :-
    nth0(R, Maze, Row),
    nth0(C, Row, s), !.

in_bounds(Maze, R, C) :-
    R >= 0,
    C >= 0,
    length(Maze, Rows),
    R < Rows,
    nth0(0, Maze, FirstRow),
    length(FirstRow, Cols),
    C < Cols.

passable_cell(Maze, R, C) :-
    cell(Maze, R, C, Value),
    Value \= w.

is_exit(Maze, R, C) :-
    cell(Maze, R, C, e).

follow_actions(Maze, R, C, [], R, C).

follow_actions(Maze, R, C, [Act|Rest], Rf, Cf) :-
    move(R, C, Act, R2, C2),
    in_bounds(Maze, R2, C2),
    passable_cell(Maze, R2, C2),
    follow_actions(Maze, R2, C2, Rest, Rf, Cf).

legal_action(left).
legal_action(right).
legal_action(up).
legal_action(down).

dfs(Maze, R, C, _, []) :-
    is_exit(Maze, R, C), !.

dfs(Maze, R, C, Visited, [Act|Rest]) :-
    legal_action(Act),
    move(R, C, Act, R2, C2),
    in_bounds(Maze, R2, C2),
    passable_cell(Maze, R2, C2),
    \+ member((R2,C2), Visited),
    dfs(Maze, R2, C2, [(R2,C2)|Visited], Rest).


find_exit(Maze, Actions) :-
    nonvar(Actions),
    valid_maze(Maze),
    find_start(Maze, R, C),
    follow_actions(Maze, R, C, Actions, Rf, Cf),
    is_exit(Maze, Rf, Cf).


find_exit(Maze, Actions) :-
    var(Actions),
    valid_maze(Maze),
    find_start(Maze, R, C),
    dfs(Maze, R, C, [(R,C)], Actions).