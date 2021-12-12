function [distLeft,distRight, distFront] = getdests(in)
%GETDESTS Summary of this function goes here
%   Detailed explanation goes here
theta = in.theta;
% initial for 0 degree to top
% > theta 0 or 360 . ^ theta 90 < theta 180 
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
elseif(theta ==180)
    %180
    xLeft = in.x;
    yLeft =in.y-1;
    xRight = in.x;
    yRight=in.y+1;
    xFront = in.x-1;
    yFront= in.y;
elseif(theta ==270)
    xLeft = in.x+1;
    yLeft =in.y;
    xRight = in.x-1;
    yRight=in.y;
    xFront = in.x;
    yFront= in.y-1;    
end
distLeft = abs(in.xd-xLeft)+abs(in.yd-yLeft);
distRight= abs(in.xd- xRight)+abs(in.yd-yRight);
distFront = abs(in.xd-xFront)+abs(in.yd-yFront);
end

