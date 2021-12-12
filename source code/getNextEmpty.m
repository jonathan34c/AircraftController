function [array] = getNextEmpty(in)
%GETNEXTEMPTY Summary of this function goes here
%   get the 9 empty space around the dot

array = [in.x in.y ;in.x-1 in.y+1; in.x in.y+1; in.x+1 in.y+1; in.x-1 in.y; in.x+1 in.y; in.x-1 in.y-1; in.x in.y-1; in.x+1 in.y-1];
end

