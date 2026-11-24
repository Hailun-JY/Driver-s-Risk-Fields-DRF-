close all
load('curve_latdev.mat')

figure(3)
hold on
plot(x_points,y_points,'s','MarkerEdgeColor',[0.5,0.5,0.5],...
    'MarkerSize',2)
plot(x_curve,y_curve,'k','Linewidth',1)

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear yticks
yticks([30,60])
yticklabels({'30','60'})
clear xticks
xticks([0,100,200])
xticklabels({'0','100','200'})
xlim([0,200])
ylim([0,60])
ylabel('TTR [%]')
xlabel('Curve radius [m]')
title('1b. Xu et al. (2018)','FontSize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='curvature_on_latdev_point_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')


