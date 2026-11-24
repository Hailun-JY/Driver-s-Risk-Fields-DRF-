function [ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_curved_section( x1,y1,theta_s,theta_e,w,R,res_rp )
%VECTOR_STRAIGHT_SECTION Summary of this function goes here
%   Detailed explanation goes here
l=R.*(abs(theta_s-theta_e));
len=l./res_rp; % length of the vector
step_theta=(theta_e-theta_s)./len;
theta_vector=theta_s:step_theta:theta_e;

[ xc,yc ] = generate_heading_curve_center( x1,y1,R,theta_s );

[ x_lc ]=xc+R.*cos(theta_vector);
[ y_lc ]=yc+R.*sin(theta_vector);

[ x_ob ]=xc+(R+w/2).*cos(theta_vector);
[ y_ob ]=yc+(R+w/2).*sin(theta_vector);

[ x_ib ]=xc+(R-w/2).*cos(theta_vector);
[ y_ib ]=yc+(R-w/2).*sin(theta_vector);

end

