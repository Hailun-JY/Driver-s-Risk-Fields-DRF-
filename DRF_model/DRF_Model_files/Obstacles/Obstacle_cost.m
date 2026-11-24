function [ OBS_cost ] = Obstacle_cost( X,Y, Obs_sequence,Os,ii,dt,Car_Nrp_Idx)
% GENERATE_CIRCUIT_ROAD_PIPE_DRF
% Generates the pipe of the road (height=1 on road, 0 outside the road)
% NOTE: This is NOT the Road_cost. It is used to compute the road cost
% INPUT:
%       X, Y : are the meshgrids of the relevant areas under consideration
% OUTPUT:
%       Circuit_road_pipe : pipe of the circuit

OBS_cost=0.*X;
% Adding all the pipes
for jj=1:length(Obs_sequence)
    if(Obs_sequence(jj)==1) % straight
         [ obs_cost_temp ] = obstacle_straight( X,Y,Os(jj,1),Os(jj,2),Os(jj,3),Os(jj,4),Os(jj,5),Os(jj,6),Os(jj,7),Os(jj,8),Os(jj,9),ii,dt,Car_Nrp_Idx,jj );
%                            obstacle_straight( X,Y,x1,      y1,      theta,   l,       w,       obs_cost,obs_v,   n_str,   n_end,   ii,dt,Car_Nrp_Idx,jj)
    elseif(Obs_sequence(jj)==0) % curves
         [ obs_cost_temp ] = obstacle_curved( X,Y,Os(jj,10),Os(jj,11),Os(jj,12),Os(jj,13),Os(jj,14), Os(jj,15),Os(jj,16),Os(jj,17),Os(jj,18),Os(jj,19),ii,dt,Car_Nrp_Idx,jj );
    else
        fprintf('Something went wrong in Obstacle Cost Generation\n')
        keyboard;
    end
    OBS_cost=OBS_cost+obs_cost_temp;  
end

end

