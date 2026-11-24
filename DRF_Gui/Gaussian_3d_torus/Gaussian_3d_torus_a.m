function [ a ] = Gaussian_3d_torus_a( arc_len,par1,dla)
%GAUSSIAN_3D_TORUS_A Summary of this function goes here


% --- 2 parabolic function (2 parameter) : START --- %
% function [ a ] = Gaussian_3d_torus_a( a_sign,arc_len,par1,tla,V)
par2=dla;
a_par=par1.*(arc_len-par2).^2;
% if arc_len > dla --> 0
a_par_sign1 = (sign(dla-arc_len)+1)./2;
% if value is negative
a_par_sign2 = (sign(a_par)+1)./2;
% if arc_len is negative
a_par_sign3 = (sign(arc_len)+1)./2;
% final a
a=a_par_sign1.*a_par_sign2.*a_par_sign3.*a_par;%.*a_sign;
end

