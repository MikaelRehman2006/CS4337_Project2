Nov 23 10:48pm

So in this session, I primarily focused on the general understanding of the project as mentioned in the paragraph I wrote before I started implementing the code. In terms of the code I was able to outline all the helper predicates that are needed and I wrote the basic foundational code for the movement and the cell access.

Nov 23: 11:50 pm
So in this session, I primarily focused on the general understanding of the project as mentioned in the paragraph I wrote before I started implementing the code. In terms of the code I was able to outline all the helper predicates that are needed and I wrote the basic foundational code for the movement and the cell access.

Nov 24: 3:10pm
So for this session, I was thinking my primary goal is to implement the maze validation portion of the project. What I want to do is to make sure that the maze is very well formed before any of the movement/searching happens. This is including the checking of all the rows that have the same lengths, all cells contain valid symbols, and also that the maze only has one start position. I am also expected this part to involve very careful list processing, but it should be pretty straightforward if I do break it into smaller helper predicates.

Nov 24: 4:03pm
In this session I was able to focus on implementing maze validation logic. What I did was that I added a few predicates that check all of the cells that contain valid symbols. I also added predicates that check that all of the rows have consistent length, and that the maze also only contains one start position. Next, I created a helper predicate to scan the entirety of the maze and collect all of the start coordinates. Id say that this part of the project definitely have me great practice with Prolog list traversal and nth0/3. And overall, the validation code feels very clean and modular, which should make the future steps of this project easier. I am hoping to start on the code next session that will be implementing locating the start coordinate directly, and adding boundary checking logic.
