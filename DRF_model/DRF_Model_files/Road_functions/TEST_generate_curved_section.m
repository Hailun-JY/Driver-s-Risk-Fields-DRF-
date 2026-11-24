% ---- This script tests the straignt section generator function ---- %
close all
figure(111)
xmesh=-10:0.1:10;
ymesh=-10:0.1:10;
[X,Y]=meshgrid(xmesh,ymesh);

x1=5; y1=0;
theta_s=(pi./180).*90;
w=0.5;
R=5;

for ii=0:360
theta_e=(pi./180).*ii;
[ road_pipe ] = generate_curved_section( X,Y,x1,y1,theta_s,theta_e,w,R  );
figure(111)
cla
hold on
surf(X,Y,road_pipe,'linestyle','none')
title(sprintf('ii=%d',ii))
pause(0.1)
end