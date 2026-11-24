function [ phiv ] = Gaussian_3d_torus_phiv( phiv_a )
% GAUSSIAN_3D_TORUS_PHIV_A
% phiv_a is in radians but can be any value.
% So for example if the car has turned about itself 3 times 
% phiv_a = 6*pi 
pi2temp=ceil(abs(phiv_a./2*pi)); % how many rotations (for e.g. 6*pi/2*pi = 3)
phiv = abs(rem(2*pi*pi2temp+phiv_a,2*pi)); % phiv interms of 0->2*pi radians
end

