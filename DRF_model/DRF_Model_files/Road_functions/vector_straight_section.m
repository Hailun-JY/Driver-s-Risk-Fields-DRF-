function [ x_ob,x_lc,x_ib, y_ob,y_lc,y_ib ] = vector_straight_section( x1,y1,theta,l,w,res_rp )
%VECTOR_STRAIGHT_SECTION Summary of this function goes here
%   Detailed explanation goes here

len=l./res_rp; % length of the vector
step_x_temp=abs(l.*cos(theta))./len;
step_y_temp=abs(l.*sin(theta))./len;
% Hacks to avoid singularities
if(step_x_temp<=1e-6 || step_y_temp<=1e-6)
%     fprintf('o Entered\n')
    theta=theta+1e-6;
end

x1_lc=x1;
y1_lc=y1;
x1_ob=x1+0.5.*w.*cos(theta+pi/2);
y1_ob=y1+0.5.*w.*sin(theta+pi/2);
x1_ib=x1+0.5.*w.*cos(theta-pi/2);
y1_ib=y1+0.5.*w.*sin(theta-pi/2);

x_lc_start=x1_lc;
x_lc_end  =x1_lc+l.*cos(theta);
y_lc_start=y1_lc;
y_lc_end  =y1_lc+l.*sin(theta);

x_ob_start=x1_ob;
x_ob_end  =x1_ob+l.*cos(theta);
y_ob_start=y1_ob;
y_ob_end  =y1_ob+l.*sin(theta);

x_ib_start=x1_ib;
x_ib_end  =x1_ib+l.*cos(theta);
y_ib_start=y1_ib;
y_ib_end  =y1_ib+l.*sin(theta);

step_x=l.*cos(theta)./len;
step_y=l.*sin(theta)./len;



[ x_lc ] = x_lc_start:   step_x    :x_lc_end; % lane center
[ y_lc ] = y_lc_start:   step_y    :y_lc_end; % lane center

[ x_ob ] = x_ob_start:   step_x    :x_ob_end; % lane center
[ y_ob ] = y_ob_start:   step_y    :y_ob_end; % lane center

[ x_ib ] = x_ib_start:   step_x    :x_ib_end; % lane center
[ y_ib ] = y_ib_start:   step_y    :y_ib_end; % lane center

end

