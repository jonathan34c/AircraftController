function [nextNotdir] = getNotDir(array1,array2)
%GETNOTDIR Summary of this function goes here
%   Detailed explanation goes here
nextNotdir = -1;
for N=1:size(array1)
    for K=1:size(array2)
        if(array1(N,1) ==array2(K,1) && array1(N,2) ==array2(K,2))
            nextNotdir = K;
            return
        end
    end
end  

 
end

