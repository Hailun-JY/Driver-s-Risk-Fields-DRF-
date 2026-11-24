
res_rp=0.1; wh=20;
[ Pipe_sequence,Is ] = generate_road_parameters( );

[ circuit_x_ob,circuit_x_lc,circuit_x_ib, circuit_y_ob,...
    circuit_y_lc,circuit_y_ib ] = Vector_road_circuit( Pipe_sequence, Is, res_rp );

[  Circuit_road_heading ] = Heading_circuit_road_solo( circuit_x_lc,circuit_y_lc,wh,Pipe_sequence,Is );

quiver_lengths_x=ones(1,length(circuit_x_lc)).*cos(Circuit_road_heading);
quiver_lengths_y=ones(1,length(circuit_x_lc)).*sin(Circuit_road_heading);

figure()
quiver(circuit_x_lc(1:200:end),circuit_y_lc(1:200:end), ...
    quiver_lengths_x(1:200:end),quiver_lengths_y(1:200:end))