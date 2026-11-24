x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels

figure(6)
hold on
ylim([-1.75,1.75])
xlim([-100,100])
clear yticks
yticks([-1.75,0,1.75])
yticklabels({'-1.75','0','1.75'})
ylabel('Lateral deviation [m] ','FontSize',fonts)
xlabel('Distance to obstacle [m]','FontSize',fonts)
title('3a. DRF model','FontSize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters obstaclewidth_on_latdev

figure(7)
hold on
title('3d. DRF model','FontSize',fonts_ticks)
xlim([-100,100])
ylim([0,30])
ylabel(sprintf('Speed [m s^{-1}]'),'FontSize',fonts)
xlabel('Distance to obstacle [m]','FontSize',fonts)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters obstaclewidth_on_speed

figure(8)
clear xticks
xticks([0,1,2,3])
xticklabels({'','narrow','wide',''})
ylim([-0.675,-0.175])
yticks([-0.6,-0.4,-0.2])
yticklabels({'-0.6','-0.4','-0.2'})
xlim([0.5,2.5])
ylabel('Min lat deviation [m]  ','Fontsize',fonts)
title('3b. DRF model','FontSize',fonts_ticks)
xlabel('Obstacle')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]);
% print -dpdf -painters obstaclewidth_on_latdev_points

figure(9)
clear xticks
xticks([0,1,2,3])
xticklabels({'','narrow','wide',''})
ylim([7.5,22.5])
yticks([10,15,20])
yticklabels({'10','15','20'})
xlim([0.5,2.5])
ylabel(sprintf('Min speed [m s^{-1}]'),'Fontsize',fonts)
title('3e. DRF model','FontSize',fonts_ticks)
xlabel('Obstacle')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]);
% print -dpdf -painters obstaclewidth_on_speed_points