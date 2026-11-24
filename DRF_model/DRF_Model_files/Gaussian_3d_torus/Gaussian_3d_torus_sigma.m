function [ sigma ] = Gaussian_3d_torus_sigma(arc_len,prb1,prb2)
%GAUSSIAN_3D_TORUS_SIGMA Summary of this function goes here
%   Detailed explanation goes here

sigma=prb1.*arc_len + prb2;


end

