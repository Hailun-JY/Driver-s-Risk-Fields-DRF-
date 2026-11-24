function [ X,Y,xbl,xbu,ybl,ybu ] = Gaussian_3d_torus_meshgrid(xv,yv,dla,res,Car_Nrp_Idx)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

% --- START : very safe way --- %
n=2;
xbl=xv-n*dla; xbu=xv+n*dla;
ybl=yv-n*dla; ybu=yv+n*dla;
x=xbl:res:xbu;
y=ybl:res:ybu;
[X,Y]=meshgrid(x,y);
% --- END : very safe way --- %

% --- START : for my circuit specifically --- %
% Car_Nrp_Idx

end

