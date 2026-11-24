close all
clear all
load('crawford_overtake.mat')
x_points=[avg_best_dist(:,1)+avg_ovt_dist(:,1)]./2;
x_points=x_points.*0.44704; % conversion from [miles/h] to [m/s]
figure(3)
hold on
% average
plot(x_points,avg_ovt_dist(:,2).*0.9144,'k') % conversion from [yards] to [m]
plot(x_points,avg_ovt_dist(:,2).*0.9144,'o','MarkerEdgeColor',[0.0,0.0,0.0],...
    'MarkerSize',2,'MarkerFaceColor',[1.0,1.0,1.0])

%%
% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear xticks
xticks([10,15,20,25])
xticklabels({'10','15','20','25'})

xlim([5,25])
ylim([0,250])
ylabel('Overtake distance [m]    ')
xlabel('Overtaken car speed [m s^{-1}]  ')
title('2c. Carwford (2007)')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters overtaking_on_dist_point_mps_lit
name_string='overtaking_on_dist_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')