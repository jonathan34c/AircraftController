function [array] = getNextEmpty(in)
%GETNEXTEMPTY Summary of this function goes here
%   get the 9 empty space around the dot


theta = in.theta;
 if(theta ==0 || theta ==360)
     array = [in.x in.y+1; in.x in.y-1; in.x+1 in.y;];
 elseif(theta ==90)
     array = [in.x-1 in.y; in.x+1 in.y; in.x in.y+1; ];
 elseif(theta ==180)
     array = [in.x in.y-1; in.x in.y+1; in.x-1 in.y; ];
 elseif(theta ==270)
     array = [in.x+1 in.y; in.x-1 in.y; in.x in.y-1; ];
 else
     array = [in.x in.y ;in.x-1 in.y+1; in.x in.y+1; in.x+1 in.y+1; in.x-1 in.y; in.x+1 in.y; in.x-1 in.y-1; in.x in.y-1; in.x+1 in.y-1];
 end

end

