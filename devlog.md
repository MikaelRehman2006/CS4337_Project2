Nov 23 10:48pm

So in this session, I primarily focused on the general understanding of the project as mentioned in the paragraph I wrote before I started implementing the code. In terms of the code I was able to outline all the helper predicates that are needed and I wrote the basic foundational code for the movement and the cell access.

Nov 23: 11:50 pm
So in this session, I primarily focused on the general understanding of the project as mentioned in the paragraph I wrote before I started implementing the code. In terms of the code I was able to outline all the helper predicates that are needed and I wrote the basic foundational code for the movement and the cell access.

Nov 24: 3:10pm
So for this session, I was thinking my primary goal is to implement the maze validation portion of the project. What I want to do is to make sure that the maze is very well formed before any of the movement/searching happens. This is including the checking of all the rows that have the same lengths, all cells contain valid symbols, and also that the maze only has one start position. I am also expected this part to involve very careful list processing, but it should be pretty straightforward if I do break it into smaller helper predicates.

Nov 24: 4:03pm
In this session I was able to focus on implementing maze validation logic. What I did was that I added a few predicates that check all of the cells that contain valid symbols. I also added predicates that check that all of the rows have consistent length, and that the maze also only contains one start position. Next, I created a helper predicate to scan the entirety of the maze and collect all of the start coordinates. Id say that this part of the project definitely have me great practice with Prolog list traversal and nth0/3. And overall, the validation code feels very clean and modular, which should make the future steps of this project easier. I am hoping to start on the code next session that will be implementing locating the start coordinate directly, and adding boundary checking logic.

Nov 25: 4:10pm
So for this session I am looking to focus on locating where the start position is inside of the maze and also just adding basic boundary checking. Both of these features are needed before I can simulate any of the movement or even verify an action list. I also need a predicate that will return the row and column of every "s" cell, and another predicate on top of this that will check whether a coordinate is within the bounds of the maze. In my opinion these should be pretty straightforward to implement using what I built in the last session. Because of this I am hoping I have the time to do another session later today. Also once these are done (the stuff I want to do this session), the core structure for the movement and validation will be done.

Nov 25: 5:44 pm
This session was great, I was able top finish the components that are needed to locate and move from the start of the maze. I also implemented find_start/3 to return the coordinates of the single start cell and added in_bounds/3 which basically confirms that a coordinate lies inside the maze. Next I added passable_cell/3 which makes sure that we do not ever step into a wall. These predicates are forming the core foundation to simulate movement, and I will use them directly when I have to implement the action-following in the next session. So overall this session went smoothly and the structure of the maze logic is solid.

Nov 25: 11:30pm
In this session I am hoping to implement the logic for following a list of actions that are though the maze. This is going to allow prolog to simulate the movement step by step and check bounds and walls. This functionality will be needed for verifying a given action list in fint_exit/2. The main work would be writing a recursive predicate that processes each action and updates the current position.
(I forgot to push the devlog for pre session thoughts)

Nov 26 12:25 am (same session, just went to the next day because of the time)
So in this session I was able to implement the entirely of the logic for following a list of actions through the maze. The follow_actions/6 predicate now updates the position step by step and it also checks both bounds and walls using the helper predicates I made from the earlier sessions. This completes the movement simulation that is needed to verify an action list. The only remaining piece I need for the verification mode is checking whether the final position is an exit, which I will add in the next session when I start working on find_exit/2.

Nov 25 8:45 pm
During this session I am looking to complete the verification mode of find_exit/2. I already do have all of the pieces to simulate the movement, so for now the only remaining tasks is just adding the is_exit/3 predicate and also integrating pretty much everything into a full find_exit/2 that would be able to verify a action list. The goal is for Prolog to succeed only if the maze is valid, the actions are legal, and the final position is an exit. This should be a straightforward combination of earlier work.

Nov 25 9:15pm
In this session all I did was add the is_exit/3 predicate, and i also completed the verficiation mode of find_exit/2, which allowed the program to check a maze, then follow a given action list, and lastly confirm the final cell is an exit.

Nov 25: 10:05 pm
In this session I want to focus on adding the search mode for find_exit/2, where prolog must automatically generate a list of valid actions that is leading from the start to the exit. I will need to implement something like a DFS style search that would explore moves, avoids walls, stays in bounds, and tracks visited positions to prevent loops. The DFS should be kind of brute force in a way, I will figure it out during the code. This is the most complex part I feel like, but I do have helper predicates I made earlier to make it a little more easier.

Nov 25: 11:22pm

So in this session I was able to add the DFS based search more so that the find_exit/2 was able to automatically generate a list of actions leading from the start to the end. I did this by used recursion, legal actions, bounds checking and a visited list to prevent any loops. This completes the core maze solving functionality.

Nov 25: 12:00 am

not many inital thoughts, but what I am looking to do is focus on extensive testing using both the predefined example mazes and the randomly generated mazes from test.pl. nsive testing using both the predefined example mazes and the randomly generated mazes from test.pl. The goal is to confirm that both verification and search modes of find_exit/2 behave exactly as expected across valid, invalid, and edge-case mazes.
