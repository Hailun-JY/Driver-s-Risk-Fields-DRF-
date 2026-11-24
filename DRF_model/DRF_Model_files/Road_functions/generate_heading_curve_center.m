function [ xc,yc ] = generate_heading_curve_center( x1,y1,R,theta_s )
% GENRERATE_HEADING_CURVE_CENTER
% 

% center of the circle
    xc=x1-R.*cos(theta_s);
    yc=y1-R.*sin(theta_s);

end

