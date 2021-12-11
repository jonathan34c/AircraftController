function [out, state ] = avoidCollision(in, state)
% Takes flight parameters of an aircraft and outputs the direction control

% in: Data Structure that stores input information for the aircraft
% controller. 
%       (in.x, in.y): Current Location of the aircraft
%       (in.xd, in.yd): Destination of aircraft
%       in.theta: Current direction of motion
%       in.m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%           - To access data (say x) from in.m, use in.m.x
%
% out : Data Structure that stores the output information from the aircraft
%       out.val: +1, 0, -1 ( +1 - turn left, 0 - go straight, -1 - turn right)
% 
% state: 
%       any state used by the controller

% Code to generate controller output

% if other one has already reach dest, keep using optimize 

% predit the direction the other aircraaft would go 
% 1. locate the position of the other aircraft relate to you in which
% quadrant
xDiff = in.x - in.m.x;
yDiff = in.y- in.m.y;
if(xDiff >=0 && yDiff>=0)
    %if the other aircraft is in the 3rd quardrant
    %turn right
     out.val = -2;
     state.mode= -1;
elseif (xDiff >=0 && yDiff <=0)
     %4th quardrant
     %turn left
     out.val =+2;
    state.mode = 1;
elseif (xDiff <=0 && yDiff >=0) 
    %2th quardrant
     %turn right
     out.val = -2;
     state.mode= -1;
elseif (xDiff <=0 && yDiff <=0) 
    %1th quardrant
      %turn left
     out.val =+2;
    state.mode = 1;
end    
     
% initial for 0 degree to top
% > theta 0 or 360 . ^ theta 90 < theta 180 



