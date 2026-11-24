function [ arc_len ] = Gaussian_3d_torus_arclen( x,y,xv,yv,delta,xc,yc,R)
%GAUSSIAN_3D_TORUS_A Summary of this function goes here
%   Detailed explanation goes here

% old 2 method
% calculate theta1 and theta2 in 0->360 format
% % % % theta1=rem(2*pi+atan2(yv-yc,xv-xc),2*pi);
% % % % theta2=rem(2*pi+atan2(y -yc,x -xc),2*pi);
% % % % theta=sign(delta).*(theta2-theta1);%(theta2_adj-theta1_adj);
% % % % arc_len=(R.*theta);

mag_u=abs(sqrt((xv-xc).^2 + (yv-yc).^2));
mag_v=abs(sqrt((x -xc).^2 + (y -yc).^2));
dot_pro=(xv-xc).*(x -xc) + (yv-yc).*(y -yc);
costheta=dot_pro ./ (mag_u.*mag_v);
theta_abs=abs(acos(costheta)); % will always br +ve
sign_theta=sign((xv-xc).*(y -yc) - (x -xc).*(yv-yc));
theta_pos_neg=sign(delta).*sign_theta.*theta_abs;
theta=rem(2.*pi+theta_pos_neg,2.*pi);
arc_len=R.*theta;
% keyboard;
end

