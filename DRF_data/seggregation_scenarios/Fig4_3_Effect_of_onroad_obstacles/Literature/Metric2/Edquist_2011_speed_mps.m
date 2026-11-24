close all
load('Edquist_2011_speed.mat')
x_values_mean=[0.25,1.25,2.25,3.25]+0.125+0.125;
x_values_max=[0.75,1.75,2.75,3.75]-0.125;
mean_error=(mean_speed_error_top(:,2)-mean_speed_error_low(:,2))./2;
max_error=(max_speed_error_top(:,2)-max_speed_error_low(:,2))./2;

figure(7)
hold on
% line([0,4],[0,0],'Color',[0.75,0.75,0.75])
bar(x_values_mean,mean_speed_mean(:,2)./3.6,'FaceColor',[0.5,0.5,0.5],...
    'EdgeColor',[0,0,0],'BarWidth', 0.25)
% bar(x_values_max,max_speed_mean(:,2)./3.6,'FaceColor',[0.0,0.0,0.0],...
%     'EdgeColor',[0,0,0],'BarWidth', 0.25)
errorbar(x_values_mean,mean_speed_mean(:,2)./3.6,mean_error./3.6,'Color',[0.0,0.0,0.0],...
    'MarkerFaceColor',[0.0,0.0,0.0],'MarkerEdgeColor',[0.0,0.0,0.0],...
    'MarkerSize',1,'LineStyle','none','CapSize',1)
% errorbar(x_values_max,max_speed_mean(:,2)./3.6,max_error./3.6,'Color',[0.5,0.5,0.5],...
%     'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5],...
%     'MarkerSize',1,'LineStyle','none','CapSize',1)

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
clear xticks
xticks([0.5,1.5,2.5,3.5])
xticklabels({'ANP','UNP','empty','full'})
figure(7)
hold on
% plot(2.25,19.25,'s','MarkerSize',5,'MarkerFacecolor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
% plot(2.25,18.5,'s','MarkerSize',5,'MarkerFacecolor',[0.0,0.0,0.0],'MarkerEdgeColor',[0,0,0])
% text(2.5,19.25,'mean speed','FontSize',fonts_ticks-1)
% text(2.5,18.5,'max speed','FontSize',fonts_ticks-1)
xlim([2,4])
ylim([11.5,16.5])
yticks([10,12,14,16])
yticklabels({'10','12','14','16'})
ylabel(sprintf('Mean speed [m s^{-1}]'))
xlabel('Parking')
title('3f. Edquist et al. (2012)')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='obstaclewidth_on_speed_point_mps_lit';
saveas(gcf,name_string,'pdf')
saveas(gcf,name_string,'png')
saveas(gcf,name_string,'epsc')

