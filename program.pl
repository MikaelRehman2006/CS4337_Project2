
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

find_start(Maze, R, C) :-
    find_all_starts(Maze, [(R,C)]).

in_bounds(Maze, R, C) :-
    R >= 0,
    C >= 0,
    length(Maze, NumRows),
    R < NumRows,
    nth0(0, Maze, FirstRow),
    length(FirstRow, NumCols),
    C < NumCols.

passable_cell(Maze, R, C) :-
    cell(Maze, R, C, Value),
    Value \= w.



follow_actions(_, R, C, [], R, C).

follow_actions(Maze, R, C, [A|Rest], Rf, Cf) :-
   
    move(R, C, A, R2, C2),
   
    in_bounds(Maze, R2, C2),

    passable_cell(Maze, R2, C2),

    follow_actions(Maze, R2, C2, Rest, Rf, Cf).



is_exit(Maze, R, C) :-
    cell(Maze, R, C, e).


find_exit(Maze, Actions) :-
    nonvar(Actions),                
    valid_maze(Maze),               
    find_start(Maze, R, C),         
    follow_actions(Maze, R, C, Actions, Rf, Cf),  
    is_exit(Maze, Rf, Cf).         