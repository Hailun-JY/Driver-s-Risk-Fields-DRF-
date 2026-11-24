% x=-10:1:1200;
% y=-10:1:1200;
x=2500:2:4500;
y=30:2:3000;
[X,Y]=meshgrid(x,y);
dt=0.1;
global Trigger_obs
Trigger_obs=ones(12,1000);
for ii=1:2
Car_Nrp_Idx=200.*ones(12,1000);

[ Obs_sequence,Os ] = obstacle_parameters( );
[ OBS_cost ] = Obstacle_cost( X,Y, Obs_sequence,Os,ii,dt,Car_Nrp_Idx);
surf(X,Y,OBS_cost,'linestyle','none')
pause(0.001)
end
