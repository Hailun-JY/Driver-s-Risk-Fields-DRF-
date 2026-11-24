function [ Pipe_sequence,Is ] = generate_road_parameters( )
% GENERATE_ROAD_PARAMETERS
%   Detailed explanation goes here

% 1=straight, 0=curve
Pipe_sequence=[1,0,1];

% Input sequence (Is)
% 11=5(straight section)+6(curved section)
% |<---straights --->||<---        curves        --->|
% x1, y1, theta, l, w, x1, y1, theta_s, theta_e, w, R
str=1:5;
crv=6:11;
Is=NaN(length(Pipe_sequence),11);
Is(1,str)  =[0,     0,      pi/2,       100,    5       ];
Is(2,crv)  =[0,     100,    pi,         pi/2,   5,  100 ];
Is(3,str)  =[100,   200,    1e-8,       100,    5       ];
end

