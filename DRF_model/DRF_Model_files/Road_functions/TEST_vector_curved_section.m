
x1=2; y1=-2;
theta_s=3*pi/2-0.1; theta_e=3*pi/2;
w=5;
R=10;
res_rp=0.1;

[ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_curved_section( x1,y1,theta_s,theta_e,w,R,res_rp );

figure()
hold on
plot(x_ob,y_ob)
plot(x_lc,y_lc)
plot(x_ib,y_ib)
axis('equal')