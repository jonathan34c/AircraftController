function [minDist] = getMinDist( in)
%GETMINDIST Summary of this function goes here
%   Detailed explanation goes here



distLeft = abs(in.xd-in.x)+abs(in.yd-in.y);
distRight= abs(in.xd- xRight)+abs(in.yd-yRight);
distFront = abs(in.xd-xFront)+abs(in.yd-yFront);

% destination and current is different
% determine which way to go 


minDist = min([distLeft, distRight, distFront]);
end

