x=-10:2:4500;
y=-10:2:3000;
[X,Y]=meshgrid(x,y);
Env=10;
figure()
[ Road_solo_cost ] = Generate_circuit_road_solo_cost( X,Y,Env,Pipe_sequence,Is );
surf(X,Y,Road_solo_cost,'linestyle','none')
