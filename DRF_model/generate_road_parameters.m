function [ Pipe_sequence,Is ] = generate_road_parameters( )
% GENERATE_ROAD_PARAMETERS
%   Detailed explanation goes here

% 1=straight, 0=curve
Pipe_sequence=[1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1];

% Input sequence (Is)
% 11=5(straight section)+6(curved section)
% |<---straights --->||<---        curves        --->|
% x1, y1, theta, l, w, x1, y1, theta_s, theta_e, w, R
str=1:5;
crv=6:11;
Is=NaN(length(Pipe_sequence),11);

Is(1,str)    =[0,     0,        pi/2,       500,     3.5          ];
Is(2,str)    =[0,     500,      pi/2,       200,     7.0          ];
Is(3,str)    =[0,     700,      pi/2,       200,     3.5          ]; % curve entry R200 W=3.5
Is(4,crv)    =[0,     900,      pi,         pi/2,    3.5,   200   ]; % curve
Is(5,str)    =[200,   1100,     1e-8,       200,     3.5          ]; % curve exit
Is(6,str)    =[400,   1100,     1e-8,       940,     3.5          ]; % obstacle width + car follwoing 
Is(7,str)   =[1340,  1100,     1e-8,       400,     3.5          ]; % overtaking (1)
Is(8,str)   =[1740,  1100,     1e-8,       160,     3.5          ]; % overtaking follow (1)
% ---- END : Parameter estimation road ---- %
Is(9,str)    =[1900,  1100,     1e-8,       200,     4.0          ]; % curve entry R200 W=4.0
Is(10,crv)    =[2100,  1100,     3*pi/2,     2*pi,    4.0,   200   ]; % curve
Is(11,str)    =[2300,  1300,     pi/2,       200,     4.0          ]; % curve exit
Is(12,str)   =[2300,  1500,     pi/2,       200,     3.5          ];
Is(13,str)   =[2300,  1700,     pi/2,       200,     3.0          ]; % curve entry R200 W=3.0
Is(14,crv)   =[2300,  1900,     pi,         pi/2,    3.0,   200   ]; % curve
Is(15,str)   =[2500,  2100,     1e-8,       200,     3.0          ]; % curve exit
Is(16,str)   =[2700,  2100,     1e-8,       200,     3.5          ];
Is(17,str)   =[2900,  2100,     1e-8,       200,     2.5          ]; % curve entry R200 W=2.5
Is(18,crv)   =[3100,  2100,     3*pi/2,     2*pi,    2.5,   200   ]; % curve
Is(19,str)   =[3300,  2300,     pi/2,       200,     2.5          ]; % curve exit
Is(20,str)   =[3300,  2500,     pi/2,       200,     3.5          ];
Is(21,str)   =[3300,  2700,     pi/2,       200,     3.5          ]; % curve entry R50 
Is(22,crv)   =[3300,  2900,     pi,         pi/2,    3.5,   100   ]; % curve
Is(23,str)   =[3400,  3000,     1e-8,       200,     3.5          ]; % curve exit
Is(24,str)   =[3600,  3000,     1e-8,       200,     3.5          ];
Is(25,str)   =[3800,  3000,     1e-8,       200,     3.5          ]; % curve entry R400 
Is(26,crv)   =[4000,  3000,     pi/2,       1e-8,    3.5,   400   ]; % curve
Is(27,str)   =[4400,  2600,     3*pi/2,     200,     3.5          ]; % curve exit

Is(28,str)   =[4400,  2400,     3*pi/2,     1260,    3.5          ]; % obstacle width + car follwoing (2)
Is(29,str)   =[4400,  1140,     3*pi/2,     400,     3.5          ]; % overtaking (2)
Is(30,str)   =[4400,  740,      3*pi/2,     240,     3.5          ]; % overtaking follow (2)

Is(31,str)   =[4400,  500,      3*pi/2,     200,     3.5          ]; % curve entry R300 
Is(32,crv)   =[4400,  300,      2*pi,       3*pi/2,  3.5,   300   ]; % curve
Is(33,str)   =[4100,  00,        pi,         200,     3.5          ]; % curve exit

Is(34,str)   =[3900,  00,        pi,         600,    3.5          ]; % assymmetric cost
Is(35,str)   =[3300,  00,        pi,         500,    2.0         ]; % oncoming
Is(36,str)   =[2800,  00,        pi,         200,    3.5         ]; % 
Is(37,str)   =[2600,  00,        pi,         200,    3.5         ]; % high cost both side
Is(38,str)   =[2400,  00,        pi,         400,    3.5         ]; % end

end

