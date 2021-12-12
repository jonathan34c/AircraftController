function [nextX,nextY] = getNextPos(in)
%GETNEXTPOS Summary of this function goes here

[distLeft, distRight , distFront] = getdests(in);

% destination and current is different
% determine which way to go 


minDist = min([distLeft, distRight, distFront]);
theta = in.theta;
  
    if(minDist == distLeft)
        if(theta ==0 || theta ==360)
            preX= in.x;
            prey = in.y+1;
        elseif(theta ==90)
            preX = in.x-1;
            prey= in.y;
        elseif(theta ==180)
            preX = in.x;
            prey= in.y-1;
        elseif(theta ==270)
            preX = in.x+1;
            prey= in.y;
        end    
    elseif(minDist == distRight)
         if(theta ==0 || theta ==360)
            preX= in.x;
            prey = in.y-1;
        elseif(theta ==90)
            preX = in.x+1;
            prey= in.y;
        elseif(theta ==180)
            preX = in.x;
            prey= in.y+1;
        elseif(theta ==270)
            preX = in.x-1;
            prey= in.y;    
        end    
    elseif(minDist== distFront)
        if(theta ==0 || theta ==360)
            preX= in.x+1;
            prey = in.y;
        elseif(theta ==90)
            preX = in.x;
            prey= in.y+1;
        elseif(theta ==180)
            preX = in.x-1;
            prey= in.y;
        elseif(theta ==270)
            preX = in.x;
            prey= in.y+1;    
        end  
    else 
        preX= in.x;
        prey = in.y;
       
    end
    
    nextX = preX;
    nextY = prey;
end

