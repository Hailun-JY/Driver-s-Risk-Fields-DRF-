function [ Pipe_sequence,Is ] = generate_road_parameters( )
% GENERATE_ROAD_PARAMETERS
%   Detailed explanation goes here

% 1=straight, 0=curve
Pipe_sequence=[1,0,1,0,1,0,1,0,1,1];

% Input sequence (Is)
% 11=5(straight section)+6(curved section)
% |<---straights --->||<---        curves        --->|
% x1, y1, theta, l, w, x1, y1, theta_s, theta_e, w, R
str=1:5;
crv=6:11;
Is=NaN(length(Pipe_sequence),11);
% Is(1,str)  =[0,     0,      pi/2,       100,    5       ];
% Is(2,crv)  =[0,     100,    pi,         pi/2,   5,  75  ];
% Is(3,str)  =[75,    175,    1e-8,       100,    5       ];
Is(1,str)    =[0,     0,      pi/2,       400,    3.5          ];
Is(2,crv)    =[0,     400,    pi,         pi/2,   3.5,  200    ];  
Is(3,str)    =[200,   600,    1e-8,       500,    3.5          ];
Is(4,crv)    =[700,   600,    3.*pi/2,    2.*pi,  3.5,  200    ]; 
Is(5,str)    =[900,   800,    pi/2,       500,    3.5          ];
Is(6,crv)    =[900,   1300,   1e-8,       pi/2,   3.5,  600    ]; 
Is(7,str)    =[300,   1900,   pi,         500,    3.5          ];
Is(8,crv)    =[-200,  1900,   3.*pi/2,    pi,     3.5,  600    ]; 
Is(9,str)    =[-800,  2500,   pi/2,       500,    3.5          ];
Is(10,str)   =[-800,  3000,   3.*pi/2,    400,    6            ];

end

