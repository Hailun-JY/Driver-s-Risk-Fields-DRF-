function [ delta ]   = Gaussian_3d_torus_delta( delta_a )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if(abs(delta_a)<1e-8)
    delta=1e-8;
else
    delta=delta_a;
end
end

