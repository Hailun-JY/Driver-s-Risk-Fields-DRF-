% DRF Model simulation data
% Mean (only)
% V             : speed
% Lat_Dev       : Lateral reference error
% Delta         : Steering angle
% Car_Nrp_Idx   : nearest road point index
skip_data=1:10:6000;
color_ns={'b','r'}; % blue for normal
Nsig=[6800,6000]; % normal,sport time step
for ii_cond=1:2
    cd('..\..\simulation_data\')
    if(ii_cond==1);load('DRFmodel_normal_setting.mat');end
    if(ii_cond==2);load('DRFmodel_sport_setting.mat');end
    cd('..\seggregation_scenarios\Fig3_Complete_trajectory')
    x=0.1.*Car_Nrp_Idx(1:Nsig(ii_cond));  % 5th column is road points.
    % The road points for the simulation were 0.1m apart 
    
    % ---- Speed ---- %
    y_mean=V(1:Nsig(ii_cond));
    figure(1)
    subplot(2,1,1)
    hold on
    plot(x(skip_data),y_mean(skip_data),color_ns{ii_cond},'linewidth',1.5,'linestyle','-')
    
    % ---- Lateral deviation ---- %
    y_mean=Lat_Dev(1:Nsig(ii_cond));
    figure(1)
    subplot(2,1,2)
    hold on
    plot(x(skip_data),y_mean(skip_data),color_ns{ii_cond},'linewidth',1.5,'linestyle','-')
    
end