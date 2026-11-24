function [ circuit_x_ob,circuit_x_lc,circuit_x_ib, circuit_y_ob,...
    circuit_y_lc,circuit_y_ib ] = Vector_road_circuit( Pipe_sequence, Is, res_rp )

%VECTOR_ROAD_CIRCUIT_LANECENTER Summary of this function goes here
%   res_rp=resolution of road points
    circuit_x_lc = [];
    circuit_y_lc = [];
    circuit_x_ob = [];
    circuit_y_ob = [];
    circuit_x_ib = [];
    circuit_y_ib = [];
for ii=1:length(Pipe_sequence)
    if(Pipe_sequence(ii)==1) % straight
         [ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_straight_section( Is(ii,1),Is(ii,2),Is(ii,3),Is(ii,4),Is(ii,5),res_rp );
    elseif(Pipe_sequence(ii)==0) % curves
         [ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_curved_section( Is(ii,6),Is(ii,7),Is(ii,8),Is(ii,9),Is(ii,10), Is(ii,11),res_rp );
    else
        fprintf('Something went wrong in Circuit Pipe Generation\n')
        keyboard;
    end
    circuit_x_lc = [circuit_x_lc,x_lc];
    circuit_y_lc = [circuit_y_lc,y_lc];
    circuit_x_ob = [circuit_x_ob,x_ob];
    circuit_y_ob = [circuit_y_ob,y_ob];
    circuit_x_ib = [circuit_x_ib,x_ib];
    circuit_y_ib = [circuit_y_ib,y_ib];
end

end

