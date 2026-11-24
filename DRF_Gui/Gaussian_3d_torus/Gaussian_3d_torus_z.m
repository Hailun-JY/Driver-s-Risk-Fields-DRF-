function [ zpure ] = Gaussian_3d_torus_z(x,y,xc,yc,R,a,sigma1,sigma2)
%GAUSSIAN_3D_TORUS Summary of this function goes here
% Inputs:
% x= x coordinate of the point under consideration
% y= y coordinate of the point under consideration
% xc= x coordinate of the circle center
% yc= y coordinate of the circle center
% R= Turning radius
% a= height of gaussian
% sigma=width of gaussian

% if ((x-xc).^2 + (y-yc).^2)-R < 0 : then point inside the circle
% if ((x-xc).^2 + (y-yc).^2)-R >= 0 : then point outside the circle

% a_inside : this variable =1 at all the points inside the circle, and 0 outside
% a_outside : this variable =1 at all the points outside the circle, and 0 inside
dist_R=sqrt((x-xc).^2 + (y-yc).^2);
a_inside= (  1-sign(dist_R-R)  )./2;
a_outside=(  1+sign(dist_R-R)  )./2;

% figure(3)
% surf(a_outside)
num=-(sqrt((x-xc).^2 + (y-yc).^2)-R).^2;

den1=2.*sigma1.^2;
zpure1=a.*a_inside.*exp(num./den1);

den2=2.*sigma2.^2;
zpure2=a.*a_outside.*exp(num./den2);

zpure=zpure1+zpure2;
end

