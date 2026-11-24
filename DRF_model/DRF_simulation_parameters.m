%% === Simulation parameters === %%
    Sr=54.9038;         % Steering ratio (estimated)
    N=4000;             % No. of steps [-]
    dt=0.1;             % Time step [s]
    res=0.1;            % Resolution of the grid [m]
    dstep_max=((pi/180)./(Sr)).*1000.*dt; % fminbond searches
    res_rp=0.1;         % resolution of plotted road (no computations)
    wh=20;              % width for heading calculations (non-critical)
    L=1.9887;           % Vehicle wheel base [m] 
    cw_ego=2.0;         % Vehicle width [m] 
    dVmax=4.*dt;        % Vehicle max decel and accel 
    dSmax=((pi/180)./(Sr)).*20.*dt; % Vehicle max steering velocity 20deg/s
    tla_h=0.5;          % Heading controller: Look ahead time [s]
    kh=4.0.*0.05;       % Heading controller: Gain [-]

%% === DRF (Risk field) parameters (Table 1) === %%
    tla=3.5;            % tla : Look ahead time [s]     
    par1=0.0064;        % p : Steepness of the parabola
    kexp1=0.*0.07275;   % k1 : inside circle
    kexp2=19.*0.07275;  % k2 : outside circle
    mcexp=0.001;        % m 
    cexp=0.5;           % c : ego car width/4;
    
%% === DRF driver Model parameters (Table 2) === %
    Ct=3000;    % 3000(normal), 5200(sport) : Cost threshold
    Vdes=21.6;  %21.6(normal),  26(sport);  : Desired speed [m/s]
    kv =dt.*70e-2/5; % (Normal: dt.*70e-2/5, Sport: dt.*150e-2/5):acceleration gain 
    kvc=(1.*0.75.*1e-3/5); % same for both : cost to velocity conversion [-]
    
%% === Driving scene parameters (Table 3) === %%
    Env=500;    % C_env : surrounding environment cost     
    [Pipe_sequence,Is]=generate_road_parameters( ); % Create the cost map of road
    [Obs_sequence,Os] = obstacle_parameters( ); % Create the cost map of obstacles
    [ circuit_x_ob,circuit_x_lc,...
      circuit_x_ib,circuit_y_ob,...
      circuit_y_lc,circuit_y_ib ] = Vector_road_circuit( Pipe_sequence, Is, res_rp );
        
%% === Initializing vectors === %%
    Xv=NaN(1,N);            % current vehicle X position
    Yv=NaN(1,N);            % current vehicle Y position
    Phiv=NaN(1,N);          % current vehicle Phi angle
    Delta=NaN(1,N);         % current vehicle steering angle
    V=NaN(1,N);             % current vehicle speed
    Lat_Dev=NaN(1,N);       % current vehicle lateral deviation
    Car_Nrp_Idx=NaN(1,N);   % current vehicle nearest road point

    Xvf=NaN(1,N);           % future vehicle X position
    Yvf=NaN(1,N);           % future vehicle Y position
    Phivf=NaN(1,N);         % future vehicle Phi angle
    Lat_Devf=NaN(1,N);      % future vehicle Lateral deviation
    Delta_h=NaN(1,N);       % heading controller steering angle
    Risk=NaN(1,N);          % risk qunatified


%% --- Initialize the state --- %
    Xv(1)=0.0;
    Yv(1)=0.0;
    Phiv(1)=pi/2;
    Delta(1)=1e-8; % very low number, but do not =0!
    V(1)=0;