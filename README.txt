*** Toy Robot ***

Toy robot is a simulator that moves a robot on a 5x5 grid


* Valid Commands *

PLACE
X, Y, DIRECTION
- Put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. If the robot is already placed, issuing another valid PLACE command will place the robot in the newly specified location.

MOVE
-Moves the toy robot one unit forward in the direction it is currently facing.

LEFT
-Rotates the robot 90 degrees to the left (i.e. counter-clockwise) without changing the position of the robot.

RIGHT
-Rotates the robot 90 degrees to the right (i.e. clockwise) without changing the position of the robot.

REPORT
-Announces the X,Y and DIRECTION the robot is facing.

QUIT
-Stops the application.


* Installing *

Ensure you have Git and Ruby installed. Then in a console execute the following commands:

git clone https://github.com/cullenjett/toy_robot.git
cd toy_robot
ruby toy_robot.rb
