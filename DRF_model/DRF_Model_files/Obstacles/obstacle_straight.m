function [ obs_str_cost ] = obstacle_straight( X,Y,x1,y1,theta,l,w,obs_cost,obs_v,n_str,n_end,ii,dt,Car_Nrp_Idx,jj)
% OBSTACLE_STRAIGHT : generates a 'pipe' for the straight
% section
% INPUTS :
    % x1, y1 : starting points of the lane center
    % theta  : angle of the road (0->2pi in counterclockwise) wrt Global X
    % l, w   : length and width of the road section
    % X, Y   : meshgrid region of interest     
% OUTPUT :
    % road_pipe : a matrix of size X or Y. Has a value 1 on the road, 0
    %                               __                       __    __
    % outside. Hence its a pipe (__|  |__) and not a groove(   |__|   ).
% FORMULA DERIVATION :
    % Doc_generate_straight_section.jpg
% Author: Sarvesh Kolekar 
% Email : s.b.kolekar@tudelft.nl, kolekar.sarvesh380@gmail.com
% Date  : 30th October 2018



% ---- Infinite lines (disregarding 'l') ---- %
% calculating the starting points of the lines 'a' and 'b'
global Trigger_obs
if(Car_Nrp_Idx(ii)>=n_str && Car_Nrp_Idx(ii)<=n_end)
% ---- Accounting for speed ----- %
ii_str=find(Trigger_obs(jj,:)==1,1);
if(isempty(ii_str))
    ii_str=1e20;
end


x1=x1+obs_v.*dt.*(ii-ii_str).*cos(theta);
y1=y1+obs_v.*dt.*(ii-ii_str).*sin(theta);

    
x1a= x1 +(w/2).*cos( theta + pi/2);
y1a= y1 +(w/2).*sin( theta + pi/2);
x1b= x1 +(w/2).*cos( theta - pi/2);
y1b= y1 +(w/2).*sin( theta - pi/2);

% slope of the lines
m=tan(theta);

a_matrix=(y1a-Y)-m.*(x1a-X);
b_matrix=(y1b-Y)-m.*(x1b-X);

sign_adj1=sign(cos(theta)); % sign adjuster
sign_adj2=sign(sin(theta)); % sign adjuster

a_half=(sign(sign_adj1.*a_matrix-0)+1)./2;
b_half=(sign(0-sign_adj1.*b_matrix)+1)./2;

road_pipe_infinite=a_half.*b_half;

% ---- chopping off using 'l' length of road ---- %
ml=tan(theta+pi/2); % slope of line
x2=x1 +(l).*cos( theta ); % end point x coordinate
y2=y1 +(l).*sin( theta ); % end point y coordinate

sl_matrix=(y1-Y)-ml.*(x1-X); % start line
el_matrix=(y2-Y)-ml.*(x2-X); % finish line

sl_half=(sign(0-sign_adj2.*sl_matrix)+1)./2;
el_half=(sign(sign_adj2.*el_matrix-0)+1)./2;

road_pipe_bounds=sl_half.*el_half;


% ---- Total road pipe ---- %
obs_str_pipe=road_pipe_infinite.*road_pipe_bounds;
obs_str_cost=obs_cost.*obs_str_pipe;

else
    obs_str_cost=0.*X; % obstacle is off
end

end

