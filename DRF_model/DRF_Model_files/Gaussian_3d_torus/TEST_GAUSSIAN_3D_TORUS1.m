clear
clc
close all
% What is the cost incurred by this suggestion
Sr=180; L=5; res=0.1;
v           =10;
xv          =0;
yv          =0;

% ---- 3d gaussian ---- %
tla=5;
par1=2.*0.0064;    % Steepness of the parabola
% Linear expansion of DRF parameters (std of gaussian)
% y=(kexp*delta + mcexp)*arc_len + cexp
kexp1=1.*0.5;%0.5;%0.015;  % [-] % inside circle
kexp2=5.*0.5;%0.5;%0.015;  % [-] % outside circle
mcexp=1e6.*0.0000001;%0.00001; % [-]
cexp=2;

for ii=1:5:180
    delta_fut_h =(pi./180).*ii./Sr;
    phiv_a      =(pi./180).*0;

    [ delta ]   = Gaussian_3d_torus_delta( delta_fut_h );
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    [ dla ]     = Gaussian_3d_torus_dla( tla,v );
    [ R ]       = Gaussian_3d_torus_R(L,delta);
    [ xc,yc ]   = Gaussian_3d_torus_xcyc(xv,yv,phiv,delta,R);
    [X,Y,xbl,xbu,ybl,ybu]=Gaussian_3d_torus_meshgrid(xv,yv,dla,res);
    [ mexp1 ]    = Gaussian_3d_torus_mexp( kexp1,mcexp,delta,v );
    [ mexp2 ]    = Gaussian_3d_torus_mexp( kexp2,mcexp,delta,v );
    [ arc_len ] = Gaussian_3d_torus_arclen(X,Y,xv,yv,delta,xc,yc,R);
    [ a ]       = Gaussian_3d_torus_a(arc_len,par1,dla);
    [ sigma1 ]   = Gaussian_3d_torus_sigma(arc_len,mexp1,cexp);
    [ sigma2 ]   = Gaussian_3d_torus_sigma(arc_len,mexp2,cexp);
    [ Z_cur ]   = Gaussian_3d_torus_z(X,Y,xc,yc,R,a,sigma1,sigma2);

    figure(1)
    cla
    Z_cur = rescale(Z_cur, 0, 1);
    surf(X,Y,Z_cur,'linestyle','none','FaceAlpha',0.5,'EdgeColor','none')
    colormap(jet);
    daspect([20 20 1])
    xlim([0 50])
    ylim([-20 20])
    zlim([0.015 1])
    pause(0.001)
    
    h = colorbar;
    set(get(h, 'YLabel'), 'string', ' Perceived risk quantification', 'Fontname', 'Times New Roman');
    hold on
    view([40, -50, 30]);
end
hold off
xlabel('x [m]', 'Fontname', 'Times New Roman');
ylabel('y [m]', 'Fontname', 'Times New Roman');



