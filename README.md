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
    
    ---Branch: winAnimation---
    The map is generaly done, but I need to make the door work. Ill probalby create a new branch. Simplify the door, and add a ending animation
    The Door in level 1 works so that after the fire works go off, you can open the door. In level 2, Ill have the fire works
    go off once you reach the end platform
    Door Animation Idea. Interact with door, once door opens, player walks over to door. Hide Player. Door Closing Annimation
    TODO:
        - Sounds
            timing
            error sound?
            tap sound
        ()add the area 2d
        ()add the coloration
        make player walk through door
            () Player Controls need to be disabled
                () add a variable on the jump and movment handeling
                () set this variable to true through game manager script
                () have each level have a different game manager script
                   each game managers script controls the win condition for that level
                    level 1: collect all the coins
                    level 2: reach the end
                    level 3: 
                () when that variable is true, the user has full control of the game, but once its false, the level has been complete, controsl are disabled, and the cut scene plays

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