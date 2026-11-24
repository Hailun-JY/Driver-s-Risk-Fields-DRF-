close all
load('Edquist_data_latdev.mat')
x_values_no_lead=[0.5,1.5,2.5,3.5];
x_values_slow_lead=[1.5,2.5,3.5];
no_lead_error=(error_top_no_lead_mean_speed(:,2)-error_low_no_lead_mean_speed(:,2))./2;
slow_lead_error=(error_top_slow_lead_mean_speed(:,2)-error_low_slow_lead_mean_speed(:,2))./2;
figure(7)
hold on
line([0,4],[0,0],'Color',[0.75,0.75,0.75])
plot(x_values_no_lead(3:4),-no_lead_mean_speed(3:4,2),'Color',[0.5,0.5,0.5])
% plot(x_values_slow_lead,slow_lead_mean_speed(:,2),'Color',[0,0,0])
errorbar(x_values_no_lead(3:4),-no_lead_mean_speed(3:4,2),no_lead_error((3:4)),'d','Color',[0.5,0.5,0.5],...
    'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5],'MarkerSize',2)
% errorbar(x_values_slow_lead,slow_lead_mean_speed(:,2),slow_lead_error,'s','Color',[0.5,0.5,0.5],...
%     'MarkerFaceColor',[0.0,0.0,0.0],'MarkerEdgeColor',[0.0,0.0,0.0],'MarkerSize',2)

% arrows
line([3.25,3.25],[0.25,0.3],'Color',[0,0,0])
plot(3.25,0.3,'^','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','k')
% arrows
line([3.25,3.25],[-0.13,-0.18],'Color',[0,0,0])
plot(3.25,-0.18,'v','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','k')

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
clear xticks
xticks(x_values_no_lead)
xticklabels({'ANP','UNP','empty','full'})
yticks([-0.2,0,0.2])
yticklabels({'-0.2','0','0.2'})
text(2.25,-0.15,'road centre','FontSize',fonts_ticks-1)
text(2.25,0.28,'parked cars','FontSize',fonts_ticks-1)

xlim([2,4])
ylim([-0.2,0.3])
ylabel('Mean lat deviation [m]     ','FontSize',fonts-5)
xlabel('Parking')
title('3c. Edquist et al. (2012)')
% Edquist, Jessica, Christina M. Rudin-Brown, and Michael G. Lenné. "The...
% effects of on-street parking and road environment visual complexity ...
% on travel speed and reaction time." Accident Analysis & Prevention 45 (2012): 759-765.
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='obstaclewidth_on_latdev_point_lit';
saveas(gcf,name_string,'pdf')
saveas(gcf,name_string,'png')
saveas(gcf,name_string,'epsc')

