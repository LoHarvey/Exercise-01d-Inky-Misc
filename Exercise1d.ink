/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = -1 //  0 Morning, 1 Noon, 2 Night
VAR keys = 0
VAR knife = 0

-> maze_start


== maze_start ==
You wake up in an empty room, with walls made of solid stone; however there is no roof so you can see the sky.(though time seems to be moving unsualy fast)
It is { advance_time()}
You have nothing on you but a flashlight, a compass, and a desire to get out of there.
Aftering turning on the light and scanning the room you see there is a path leading east and annother leading west. 
{keys >= 1:You have {keys} key(s)}
{knife == 1:You have a knife}
+ [Go East] -> east_path
+ [Go West] -> west_path

== east_path ==
As you reach the end of the path it opens into a room with 3 chests lining the back wall.
It is { advance_time()}
{keys >= 1:You have {keys} key(s)} 
{knife == 1:You have a knife}
* [Open The Leftmost Chest] -> left_chest
* [Open The Middle Chest] -> middle_chest
* [Open The Rightmost Chest] -> right_chest
+ [Go Back] -> maze_start

== left_chest ==
In the left chest, you find {not middle_chest:what appears to be a golden skeleton key!}{middle_chest:annother key!}
~ keys = keys + 1
+ [Go Back] -> east_path

== middle_chest ==
In the middle chest, you find {not left_chest:what appears to be a golden skeleton key!}{left_chest:annother key!}
~ keys = keys + 1
+ [Go Back] -> east_path

== right_chest ==
In the right chest, you find an average sized survival knife.
~ knife = knife + 1
+ [Go Back] -> east_path

== west_path ==
At the end of the west path, it branches into two more paths, heading north and south.
It is { advance_time()}
{keys >= 1:You have {keys} key(s)} 
{knife == 1:You have a knife}
+ [Go North] -> west_north
+ [Go South] -> west_south
+ [Go Back] -> maze_start

== west_north ==
After a few minutes of heading north, you reach a dead end. However, you notice that the stone wall has a cresent moon carved into it.
It is { advance_time()}
{time == 2:Suddenly, as the moon moves over head its light shines on the wall, seemingly creating a ladder out of thin air. The ladder leads out onto the top of the structure}
{keys >= 1:You have {keys} key(s)} 
{knife == 1:You have a knife}
* {time == 2}[Take The Ladder Out] -> escape
+ [Turn Back] -> west_path
-> END

== west_south ==
After about a minute of walking, you reach a large metal door. 
The door seems to be secured by 2 very old locks.
It is { advance_time()}
{keys >= 1:You have {keys} key(s)} 
{knife == 1:You have a knife}
* {keys == 2} [Use Your Keys to Unlock The Door]
    ~ keys = keys - 2
    -> almost_out
+ [Go Back] -> west_path

== almost_out ==
After both locks are opened, they clash to the floor. You then try to open the door, but are only able to crack it by a few inches.
On closer observation it seems there is a rope tied on the otherside of the door, keeping it shut
{keys >= 1:You have {keys} key(s)} 
{knife == 1:You have a knife}
* {knife == 1} [Use Your Knife to Cut The Rope] -> escape

== escape ==
Congrats! You won!
->END

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
    
    }
    
        
    ~ return time
    
    
    
