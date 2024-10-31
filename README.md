The Read me File will be used as a log

----Branch: creatingLevelTwo---

Goal: Create a sliding and fallimg animation for player, along with dust particles when sliding

Goal: Create a functional level 2
- What should Level 2 look like?
    What is End Goal? - To Reach the End!!!
        collect coins?
        reach the end?
    Implemented upsidown button
    Need to make there camera have a max lag time between the player so the falling section works

    ---Branch: maxFallSpeed---
    Goal: create a group of functions and variables that can be 
    used to set the max speed the player can fall
        var maxFallSpeed
        func setMaxFallSpeed

Goal: Polishing up
    Make the Tileset fancy and add some backgrounding
    add detial to the map, like objects, coins,...

-----Branch: playerStateMachine-----

Commit 2: Move Player Code into the appropriate states to organize
Now that the State Machine exist, Im going to move as much player code into its proper section as possible
I alos implemented Wall Jumping by adding the if sliding condition to the jump handeling

Commit 1: Create the State Machine
switch statments dont exist in Godot, instead they have mathc, which function similarly


 - How to wall jump:
    Trying to move into the wall and falling, then press jump
    Need to be sliding to wall jump
        - create a state where your sliding, then if sliding and jump allow wall jump
            - ***Create a State Machine? - Somethign to keep track of which state the character is in
        Sliding: 
            Criterial: 
                - Not touching ground
                - velocity.y is negative
                - input on side of the wall is being pressed
                    - direction is not 0
            Effect:
                - Gravity is halfed when sliding / gravity is lowered
            Sprite: 
                - Will need one animation, preferably that has motion, and is moer than one slide
                - Add dust particles usign the particle node for style points
            Sound: 
                - When sliding, play wall sliding noise
                - To play sliding noise seamlessly, have the noise auto play, but when in sliding state turn volume up, and when not mute
                - For wall jump, use button tick noise and jump noise at same time

 - Have a bool that will keep track of my jumping
    - Sets to True at start, then any time you jump it goes false, and doesnt become true again until you touch the ground/land
    - This variable will be tied into jumping, and you wont be allowed to jump until its true again.


Can I add a read me through GitHub and then pull it?
 - Yes