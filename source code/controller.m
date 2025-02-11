 function [ out, state ] = controller( in, state )
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


% Initialize state
if (isempty(state))
    state.mode = 0; 
end

% Code to generate controller output
theta = in.theta;
% initial for 0 degree to top
% > theta 0 or 360 . ^ theta 90 < theta 180 
 xLeft = in.x;
 yLeft =in.y;
 xRight = in.x;
 yRight=in.y;
 xFront = in.x;
 yFront= in.y;
if(theta ==0 || theta ==360)
    xLeft = in.x;
    yLeft =in.y+1;
    xRight = in.x;
    yRight=in.y-1;
    xFront = in.x+1;
    yFront= in.y;
elseif(theta ==90)
    xLeft = in.x-1;
    yLeft =in.y;
    xRight = in.x+1;
    yRight=in.y;
    xFront = in.x;
    yFront= in.y+1;
else 
    %180
    xLeft = in.x;
    yLeft =in.y-1;
    xRight = in.x;
    yRight=in.y+1;
    xFront = in.x-1;
    yFront= in.y;
end
distLeft = abs(in.xd-xLeft)+abs(in.yd-yLeft);
distRight= abs(in.xd- xRight)+abs(in.yd-yRight);
distFront = abs(in.xd-xFront)+abs(in.yd-yFront);

% destination and current is different
% determine which way to go 


minDist = min([distLeft, distRight, distFront]);
if(minDist == distLeft)
    out.val =+1;
    state.mode = 1;
elseif(minDist == distRight)
     out.val = -1;
     state.mode=-1;
elseif(minDist== distFront)
    out.val =0;
    state.mode=0;
else 
    out.val =2;
    state.mode=2;
end    

% if (state.mode == 0)
%     out.val = +1;
%     state.mode = 1;
% elseif (state.mode == 1)
%     out.val = 0;
%     state.mode = 0;
% end