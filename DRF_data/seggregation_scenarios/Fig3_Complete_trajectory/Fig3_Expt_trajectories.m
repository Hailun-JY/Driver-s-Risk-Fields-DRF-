% Experiment data (avg over 10 trials)
% Mean and Std
% Column(1) : speed
% Column(2) : measured_wheel_angle (Steering angle)
% Column(3) : lateral_reference_error
% Column(4) : road_width
% Column(5) : nearest_rp_index
% Column(6) : road_radius
skip_data=1:20:60000;
skip_data_patch=1:50:60000;
close (figure(1))
color_ns={'b','r'}; % blue for normal
for ii_cond=1:2
    cd('..\..\expt_data\')
    if(ii_cond==1);load('Avg_data_10_trials_normal.mat');end
    if(ii_cond==2);load('Avg_data_10_trials_sport.mat');end
    cd('..\seggregation_scenarios\Fig3_Complete_trajectory')
    nsigma=2; % shows +/- nsigma width of shaded region
    x=0.2.*Avg_data.mean(:,5);  % 5th column is road points.
    % Each road point is 0.2m apart
    
    % ---- Road width ---- %
    y_mean_l=Avg_data.mean(:,4)/2;  % road width left
    y_mean_r=-Avg_data.mean(:,4)/2;  % road width left

    figure(1)
    subplot(2,1,2)
    hold on
    plot(x(skip_data),y_mean_l(skip_data),'k')
    plot(x(skip_data),y_mean_r(skip_data),'k')
    % overtaking lane 1
    line([2354,2754],1.75.*[1,1],'color','w','linewidth',1.1)
    line([2354,2754],1.75.*[1,1],'color',[0.5,0.5,0.5])
    line([2354,2754],1.75+3.5.*[1,1],'color','k')
    line([2354,2354],[1.75,1.75+3.5],'color','k')
    line([2754,2754],[1.75,1.75+3.5],'color','k')
    % overtaking lane 2
    line([8702,9102],1.75.*[1,1],'color','w','linewidth',1.1)
    line([8702,9102],1.75.*[1,1],'color',[0.5,0.5,0.5])
    line([8702,9102],1.75+3.5.*[1,1],'color','k')
    line([8702,8702],[1.75,1.75+3.5],'color','k')
    line([9102,9102],[1.75,1.75+3.5],'color','k')
    % ooncoming lane
    line([10813.4,11313.2],3.*[1,1],'color','k')
    line([10813.4,10813.4],[3,1],'color','k')
    line([11313.2,11313.2],[3,1],'color','k')
    
    % ---- Road curvature ---- %
    y_mean=-1./Avg_data.mean(:,6);  % road curvature
    figure(1)
    subplot(2,1,1)
    hold on
    yyaxis right
    plot(x(skip_data),y_mean(skip_data),'color',0.*[1,1,1])
    ylabel('Curvature [m^{-1}]')
    
    % ---- Speed ---- %
    y_mean=Avg_data.mean(:,1);  % mean speed (over 10 trials)
    y_std_top=y_mean + nsigma.*Avg_data.std(:,1); % top line (std of speed)
    y_std_bot=y_mean - nsigma.*Avg_data.std(:,1); % bottom line (std of speed)
    figure(1)
    subplot(2,1,1)
    hold on
    yyaxis left
    p1=patch([x(skip_data_patch).',flip(x(skip_data_patch).')],[y_std_top(skip_data_patch).',flip(y_std_bot(skip_data_patch).')],color_ns{ii_cond},...
        'FaceAlpha',0.15,'EdgeColor','none');
    plot(x(skip_data),y_mean(skip_data),color_ns{ii_cond},'linestyle',':','linewidth',2)
    ylabel('Speed [m/s]')
    
    % ---- Lateral Deviation ---- %
    y_mean=-Avg_data.mean(:,3)-0.25.*Avg_data.mean(:,4);  % mean lateral deviation(over 10 trials)
    % The sign has to be flipped and 1/4th of road width needs to subtracted
    % This error creeped in while wrting the Matlab file for generating the
    % .scene file for dueca (DUECA_RoadGenerator) : EH version
    y_std_top=y_mean + nsigma.*Avg_data.std(:,3); % top line (std of speed)
    y_std_bot=y_mean - nsigma.*Avg_data.std(:,3); % bottom line (std of speed)
    figure(1)
    subplot(2,1,2)
    hold on
    p1=patch([x(skip_data_patch).',flip(x(skip_data_patch).')],[y_std_top(skip_data_patch).',flip(y_std_bot(skip_data_patch).')],color_ns{ii_cond},...
        'FaceAlpha',0.15,'EdgeColor','none');
    plot(x(skip_data),y_mean(skip_data),color_ns{ii_cond},'linestyle',':','linewidth',2)
    
end



