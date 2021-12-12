function [nextX,nextY] = getNextPos(in)
%GETNEXTPOS Summary of this function goes here
%   Detailed explanation goes here
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
        if(theta ==0 || theta ==360)
            preX= in.x;
            prey = in.y+1;
        elseif(theta ==90)
            preX = in.x-1;
            prey= in.y;
        else
            preX = in.x;
            prey= in.y-1;
        end    
    elseif(minDist == distRight)
         if(theta ==0 || theta ==360)
            preX= in.x;
            prey = in.y-1;
        elseif(theta ==90)
            preX = in.x+1;
            prey= in.y;
        else
            preX = in.x;
            prey= in.y+1;
        end    
    elseif(minDist== distFront)
        if(theta ==0 || theta ==360)
            preX= in.x+1;
            prey = in.y;
        elseif(theta ==90)
            preX = in.x;
            prey= in.y+1;
        else
            preX = in.x-1;
            prey= in.y;
        end  
    else 
        preX= in.x;
        prey = in.y;
       
    end
    
    nextX = preX;
    nextY = prey;
end

