function [ xc,yc ] = Gaussian_3d_torus_xcyc( xv,yv,phiv,delta,R )
%GAUSSIAN_3D_TORUS_XCYC Summary of this function goes here
% Detailed explanation goes here
% phil=phi_line
if (delta>0)
    phil=phiv+pi/2;  
else
    phil=phiv-pi/2;
end
xc=R*cos(phil) + xv;
yc=R*sin(phil) + yv;

% keyboard;

end

