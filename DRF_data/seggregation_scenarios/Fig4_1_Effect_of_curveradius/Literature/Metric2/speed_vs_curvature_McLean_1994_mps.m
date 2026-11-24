close all
load('speed_vs_curvature_McLean_1994.mat')

% ---- m/s : converted format ---- %
figure(4)
hold on
plot(taragin_points(:,1),taragin_points(:,2)./3.6,'s',...
    'MarkerEdgeColor',[0.5,0.5,0.5],...
    'MarkerSize',3)

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear xticks
xticks([0,300,600])
xticklabels({'0','300','600'})
xlim([0,600])
ylim([36,110]./3.6)
title('1d. Taragin & Leisch (1954)  ','FontSize',fonts_ticks)
%DMR, N.S.W. (1969). The behaviour of drivers on horizontal curves. Main Rds, vol. 34, no.4, pp. 127-128
ylabel('Speed_{curve centre} [m s^{-1}]    ')
xlabel('Curve radius [m]')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='curvature_on_speed_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')

