close all
x1=0; y1=0;
l=10;
w=5;
res_rp=0.1;

for(ii=90:360)
theta=ii.*(pi/180);
[ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_straight_section( x1,y1,theta,l,w,res_rp );
cla
figure(1)
hold on
plot(x_ob,y_ob,'b')
plot(x_lc,y_lc,'k--')
plot(x_ib,y_ib,'r')
axis('square')
title(sprintf('ii=%d',ii))
pause(0.1)
end
