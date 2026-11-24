close all

% Table 2 from 2016_Shuo_Liu
lw=[2.85,3.0,3.25,3.5,3.75];
% speed for 0.5m shoulder width right lane
speed=[56.18,60.78,65.46,76.85,81.92]./3.6;
std=[6.45,8.18,9.96,10.73,11.65]./3.6;

figure(6)
hold on
errorbar(lw,speed,std,'linestyle','none','color',[0.5,0.5,0.5])
plot(lw,speed,'o','MarkerSize',5,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])



% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear xticks
xticks([2,2.5,3,3.5,4.0])
% xticklabels({'3.0','3.5','4.0','4.5'})
yticks([10,15,20,25])
yticklabels({'10','15','20','25'})
xlim([2,4.25])
ylim([10,26])
ylabel('Mean speed [m s^{-1}]')
xlabel('Lane width [m]')
title('2d. Liu et al. (2016)  ','FontSize',fonts_ticks)
% Fitzpatrick, Kay, et al. Design factors that affect driver speed on suburban arterials. No. FHWA/TX-00/1769-3,. 2000.
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='roadwidth_on_speed_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')

