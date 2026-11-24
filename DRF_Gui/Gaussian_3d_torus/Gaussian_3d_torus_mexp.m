function [ mexp ]    = Gaussian_3d_torus_mexp( kexp,mcexp,delta,v,delta1,dt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

mexp=mcexp+kexp.*abs(delta);
end

