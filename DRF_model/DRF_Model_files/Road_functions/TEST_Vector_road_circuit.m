

 [ Pipe_sequence,Is ] = generate_road_parameters( );
 res_rp=0.1;

[ circuit_x_ob,circuit_x_lc,circuit_x_ib, circuit_y_ob,...
    circuit_y_lc,circuit_y_ib ] = Vector_road_circuit( Pipe_sequence, Is, res_rp );

figure(1001)
hold on
plot(circuit_x_lc,circuit_y_lc,'k--')
plot(circuit_x_ib,circuit_y_ib,'r')
plot(circuit_x_ob,circuit_y_ob,'r')