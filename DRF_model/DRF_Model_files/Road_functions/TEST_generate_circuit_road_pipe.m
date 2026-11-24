
x=-1500:2:3000;
y=-10:2:4000;
[X,Y]=meshgrid(x,y);

[ Pipe_sequence,Is  ] = generate_road_parameters( ); % this script loads Pipe_sequence and Is matrices
[ Circuit_road_pipe ] = generate_circuit_road_pipe( X,Y, Pipe_sequence,Is);
figure()
surf(X,Y,Circuit_road_pipe,'linestyle','none')
