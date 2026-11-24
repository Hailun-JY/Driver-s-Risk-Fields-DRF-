function [ dla ]     = Gaussian_3d_torus_dla( tla,V )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dla=tla.*V;
if(dla<1)
    dla=1;
end

end

