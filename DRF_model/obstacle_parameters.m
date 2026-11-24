function [ Obs_sequence,Os ] = obstacle_parameters( )
% GENERATE_OBSTACLE_PARAMETERS
% Defines the matrix with all the details for the obstalces

% 1=straight, 0=curve
Obs_sequence=[1,1,1,1,1,1,1,1,1,1,1,1,1,1];

% Input sequence (Is)
% 19=9(straight section)+10(curved section)
% |<---              straights              --->|     |<---                   curves                    --->|
% x1, y1, theta, l, w,obs_cost,obs_v,n_str,n_end,     x1, y1, theta_s, theta_e,w, R, obs_cost,obs_v,n_str,n_end
%  1   2    3    4  5     6       7    8     9        10  11     12       13   14 15    16      17    18    19  
str_obs=1:9;
crv_obs=10:19;
Env=500; % environmental cost
ov_lane=3.5; % overtake lane cost
c_w=1.8;% obstacle car width
r_w=3.5;% normal lane width
ocw=2.0;% oncoming lane width
c_c=2500; % obstacle car cost

Os=NaN(length(Obs_sequence),19);

Os(1,str_obs)  =[500,            1101.750,         1e-8,           5,         c_w,            c_c,                   0,              1,              inf]; % obstacle width 1
Os(2,str_obs)  =[900,            1100,             1e-8,           5,         c_w,            c_c,                   12.5,           18000,          22000]; % car following 1
Os(3,str_obs)  =[1340,           1100+r_w,         1e-8,           400,       r_w,            -Env+ov_lane,          0,              1,              inf]; % virtual lane overtake 1
Os(4,str_obs)  =[1450,           1100,             1e-8,           5,         c_w,            c_c,                   7.5,            23000,          27750]; % car to be overtaken 1
Os(5,str_obs)  =[4401.251,       2300,             3*pi/2,         5,         c_w,            c_c,                   0,              1,              inf]; % obstacle width 2
Os(6,str_obs)  =[4400,           1880,             3*pi/2,         5,         c_w,            c_c,                   15,             78500,          84500]; % car following 2
Os(7,str_obs)  =[4400+r_w,       1140,             3*pi/2,         400,       r_w,            -Env+ov_lane,          0,              1,              inf]; % virtual lane overtake 2
Os(8,str_obs)  =[4400,           1020,             3*pi/2,         5,         c_w,            c_c,                   10.0,           87100,          91100]; % car to be overtaken 2
Os(9,str_obs)  =[3900,           -(r_w+c_w)/2,     pi,             200,       c_w,            c_c,                   0,              1,              inf]; % assymmetric cost 
Os(10,str_obs) =[3300,           -ocw,             pi,             500,       ocw,           -Env+(ov_lane*4),       0,              1,              inf]; % virtual lane oncoming 
Os(11,str_obs) =[3000,           -2.3153,          1e-8,           5,         c_w,            c_c,                   5.0,            108200,         inf]; % car oncoming 1
Os(12,str_obs) =[2750,           -2.0103,          1e-8,           5,         c_w,            c_c,                   5.0,            108200,         inf]; % car oncoming 2
Os(13,str_obs) =[2600,           (r_w+c_w)/2,     pi,             200,       c_w,            c_c,                   0,              1,              inf]; % symmetric cost top 
Os(14,str_obs) =[2600,          -(r_w+c_w)/2,     pi,             200,       c_w,            c_c,                   0,              1,              inf]; % symmetric cost bottom 
                                                                 
end

