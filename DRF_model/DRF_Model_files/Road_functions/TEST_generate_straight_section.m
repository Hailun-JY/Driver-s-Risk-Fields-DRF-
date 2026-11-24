% ---- This script tests the straignt section generator function ---- %
close all
figure(111)
xmesh=-10:0.1:20;
ymesh=-10:0.1:20;
[X,Y]=meshgrid(xmesh,ymesh);

x1=2; y1=5;
l=10; w=2;
for ii=1:360
theta=(pi./180).*ii;
[ road_pipe ] = generate_straight_section( X,Y,x1,y1,theta,l,w );
figure(111)
cla
hold on
surf(X,Y,road_pipe,'linestyle','none')
title(sprintf('ii=%d',ii))
pause(0.1)
end