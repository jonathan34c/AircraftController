function [flag] = reachEnd(in)
%REACHEND Summary of this function goes here
%   Detailed explanation goes here
flag = (in.x == in.xd && in.y==in.yd)
end

