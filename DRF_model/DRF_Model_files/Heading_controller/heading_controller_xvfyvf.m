function [xvf,yvf,phivf]=heading_controller_xvfyvf(xc,yc,R,xv,yv,...
                                                    delta,dla)
%HEADING_CONTROLLER_XVFYVF Summary of this function goes here
%   Detailed explanation goes here

% phivf is between 0 and 360 degrees
theta1=rem(2*pi + atan2(yv-yc,xv-xc),2*pi);
theta=dla./R;

if (delta<0)
theta2=rem(2*pi+theta1-theta,2*pi);
else
theta2=rem(2*pi+theta1+theta,2*pi);
end

xvf=xc + (R.*cos(theta2));
yvf=yc + (R.*sin(theta2));

if (delta<0)
     phivf=rem(2*pi+theta2-pi/2,2*pi);
else
     phivf=rem(2*pi+theta2+pi/2,2*pi);
end

end

