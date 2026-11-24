function [ Road_solo_cost ] = Generate_circuit_road_solo_cost( X,Y,Env,Pipe_sequence,Is )
% GENERATE_CIRCUIT_ROAD_SOLO_COST 
% This function calculates the cost due to road ONLY
% INPUTS:
%       X, Y : meshgrid under consideration
%       Env  : The cot of the environment
% OUTPUTS:
%       Road_solo_cost : Road cost only. So the environment (outside) the
%       road is at a cost of 'Env' per dot and on the road its 0.

[ Circuit_road_pipe ] = generate_circuit_road_pipe( X,Y,Pipe_sequence,Is );
Road_solo_cost=Env-Env.*Circuit_road_pipe;
end

