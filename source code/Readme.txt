----------------------------
CS6376 Final Project, Fall 2021 Vanderbilt University
----------------------------

The project requires to implement a aircraft collision avoidance system using matlab.

Organization
------------
The skeleton code consists of following files:
1. simulateStep(out, in, v, k, q): Computes the updated aircraft state based on controller output and previous state, that is used as input for the controller in the next iteration
2. runSimulation(s1, t1, s2, t2, timeout): Runs the simulation for given source and destination locations of aircraft until they reach their destination or timeout happens. 
3. controller(in, state): Computes the controller output based on the current state of the aircraft. This is the "simple controller" that navigate the aircraft to the destination in the shortest route.
4. avoidCollision(in, state): similer to controller function, but with collision avoidance system. This function is refer to as "complex controller" in the project paper

Usage
-----
To run the simulation use the following command
runSimulation(s1, t1, s2, t2)

For example, say A goes from (0, 0) -> (0, 10) and B goes from (-5, 5) -> (5, 5). To run the simulation for at most 30 steps the following command is used. 
runSimulation([0, 0], [0, 10], [-5, 5], [5, 5], 40)

Test Cases: 
-----------
Use the following test cases to test your code:
runSimulation([0, 0], [0, 10], [5, 10], [10, 5], 40)
runSimulation([0, 0], [0, 10], [-5, 5], [5, 5], 40)
runSimulation([0, 0], [0, 10], [10, 0], [0, 0], 40)
runSimulation([0, 0], [10, 10], [10, 0], [0, 10], 40)
runSimulation([0, 5], [15, 5], [5, 10], [15, 0], 40)

