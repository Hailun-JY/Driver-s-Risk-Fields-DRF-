function [ Circuit_road_pipe ] = generate_circuit_road_pipe( X,Y, Pipe_sequence,Is)
% GENERATE_CIRCUIT_ROAD_PIPE_DRF
% Generates the pipe of the road (height=1 on road, 0 outside the road)
% NOTE: This is NOT the Road_cost. It is used to compute the road cost
% INPUT:
%       X, Y : are the meshgrids of the relevant areas under consideration
% OUTPUT:
%       Circuit_road_pipe : pipe of the circuit

Circuit_road_pipe=0.*X;
% Adding all the pipes
for ii=1:length(Pipe_sequence)
    if(Pipe_sequence(ii)==1) % straight
         [ road_pipe ] = generate_straight_section( X,Y,Is(ii,1),Is(ii,2),Is(ii,3),Is(ii,4),Is(ii,5) );
    elseif(Pipe_sequence(ii)==0) % curves
         [ road_pipe ] = generate_curved_section( X,Y,Is(ii,6),Is(ii,7),Is(ii,8),Is(ii,9),Is(ii,10), Is(ii,11) );
    else
        fprintf('Something went wrong in Circuit Pipe Generation\n')
        keyboard;
    end
    Circuit_road_pipe=Circuit_road_pipe+road_pipe;  
end

end

