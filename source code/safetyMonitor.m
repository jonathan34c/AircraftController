function [ flag ] = safetyMonitor( in1, in2, d)
% in1, in2: Data Structure that stores information about the aircraft
%       (x, y): Current Location of the aircraft
%       (xd, yd): Destination of aircraft
%       theta: Current direction of motion
%       m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%
% flag: true if the safety is voilated and false otherwise.

xDiff= abs(in1.x-in2.x);
yDiff = abs(in1.y-in2.y);
if(xDiff> d && yDiff >d)
    flag = false
else 
    flag = true
end

