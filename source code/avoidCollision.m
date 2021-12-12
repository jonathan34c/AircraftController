function [out, state ] = avoidCollision(in, state)
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

[distLeft, distRight , distFront] = getdests(in);

% destination and current is different
% determine which way to go 

theta = in.theta;
minDist = min([distLeft, distRight, distFront]); 

isNear= false;

if((~isempty(in.m)) && (~reachEnd(in)&& ~reachEnd(in.m)) )
    % predict next position of other airlpane
    [otherNextX, otherNextY] = getNextPos(in.m);
    
    
%      xDiff = in.x-in.m.x;
%      yDiff= in.y-in.m.y;
%      if(xDiff>=0 &&yDiff>=0)
%          out.val =+1;
%          state.mode = 1;
%          return 
%      elseif(xDiff<0 &&yDiff>0)
%          out.val = -1;
%          state.mode=-1;
%          return
%      elseif(xDiff<0 &&yDiff<0)
%          out.val = -1;
%          state.mode=-1;
%          return
%      elseif(xDiff>0 &&yDiff<0)
%          out.val =+1;
%          state.mode = 1;
%          return 
%      end
    otherPosArray= getNextEmpty(in.m);
    myPosArray = getNextEmpty(in);
%     
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
         
         for N=1:size(otherPosArray)
             if(otherPosArray(N,1)==preX && otherPosArray(N,2)==prey)
                 minDist = distRight;
             end
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
          
          for N=1:size(otherPosArray)
             if(otherPosArray(N,1)==preX && otherPosArray(N,2)==prey)
                 minDist = distLeft;
             end
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
         for N=1:size(otherPosArray)
             if(otherPosArray(N,1)==preX && otherPosArray(N,2)==prey)
                 minDist = min([distLeft, distRight]); 
             end
         end
        
     end

    %try to go prev
    


end


if(minDist == distLeft)
    out.val =+1;
    state.mode = 1;
elseif(minDist == distRight)
     out.val = -1;
     state.mode=-1;
elseif(minDist== distFront)
    out.val =0;
    state.mode=0;
end   


