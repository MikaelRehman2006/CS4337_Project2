How to Run the Program

1. Open SWI-Prolog from the project directory:

& "C:\Program Files\swipl\bin\swipl.exe" (or whatever it may be I usethat)

2. Load all project files:

?- [program, example, test].

3. Run verification mode (checks whether a given action list reaches an exit):

?- basic_map(M), find_exit(M, [down,left,down]).

4. Run generation mode (Prolog finds a valid path automatically):

?- basic_map(M), find_exit(M, A).

5. Generate a random maze and attempt to solve it:

?- test:gen_map(4, 10, 10, M), display_map(M), find_exit(M, A).
