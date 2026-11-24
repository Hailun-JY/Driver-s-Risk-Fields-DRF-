function [ road_pipe ] = generate_curved_section( X,Y,x1,y1,theta_s,theta_e,w,R  )

% GENERATE_CURVED_SECTION_DRF : generates a 'pipe' for the curved section
% INPUTS :
    % x1, y1 : starting points of the lane center
    % theta_s, theta_e  : start and end angle of the curve (0 to 2pi)
    % w,R   : width and Radius of the road section
    % X, Y   : meshgrid region of interest     
% OUTPUT :
    % road_pipe : a matrix of size X or Y. Has a value 1 on the road, 0
    %                               __                       __    __
    % outside. Hence its a pipe (__|  |__) and not a groove(   |__|   ).
% FORMULA DERIVATION :
    % Doc_generate_curved_section.jpg
% Author: Sarvesh Kolekar 
% Email : s.b.kolekar@tudelft.nl, kolekar.sarvesh380@gmail.com
% Date  : 31st October 2018

    % ---- Infinite lines (disregarding 'l') ---- %
    % center of the circle
    [ xc,yc ] = generate_heading_curve_center( x1,y1,R,theta_s );
    
    a_matrix=(X-xc).^2 + (Y-yc).^2 - (R+w/2).^2;
    b_matrix=(X-xc).^2 + (Y-yc).^2 - (R-w/2).^2;
    
    a_half=(sign(-a_matrix)+1)./2;
    b_half=(sign(b_matrix)+1)./2;
    
    road_pipe_infinite=a_half.*b_half;
    
    % ---- chopping off using 'theta_e' angular spread of the arc ---- %
    theta_matrix=rem((atan2((Y-yc),(X-xc)) +2.*pi), 2.*pi);
    theta_sl=min(theta_s,theta_e);
    theta_el=max(theta_s,theta_e);
    
    sl_matrix=theta_matrix-theta_sl;
    el_matrix=theta_el-theta_matrix;   
    sl_half=(sign(sl_matrix)+1)./2;
    el_half=(sign(el_matrix)+1)./2;

    road_pipe_bound=sl_half.*el_half;
    road_pipe=road_pipe_bound.*road_pipe_infinite;

    
end

