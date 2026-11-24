close all
clear all
load('Chen_data_2015.mat')
mph2mps=0.44704;
figure(3)
hold on

plot(speed_10_20(:,1).*mph2mps,speed_10_20(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([1.0,1.0,1.0]-0.2))
plot(speed_20_30(:,1).*mph2mps,speed_20_30(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.9,0.9,0.9]-0.2))
plot(speed_30_40(:,1).*mph2mps,speed_30_40(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.8,0.8,0.8]-0.2))
plot(speed_40_50(:,1).*mph2mps,speed_40_50(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.7,0.7,0.7]-0.2))
plot(speed_50_60(:,1).*mph2mps,speed_50_60(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.6,0.6,0.6]-0.2))
plot(speed_60_70(:,1).*mph2mps,speed_60_70(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.5,0.5,0.5]-0.2))
plot(speed_70_80(:,1).*mph2mps,speed_70_80(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.4,0.4,0.4]-0.2))
plot(speed_80_90(:,1).*mph2mps,speed_80_90(:,2),'o','MarkerEdgeColor','none',...
    'MarkerSize',3,'MarkerFaceColor',0.*([0.3,0.3,0.3]-0.2))

plot(curve_solid(:,1).*mph2mps,curve_solid(:,2),'Color',[0.5,0.5,0.5],'LineStyle','-','LineWidth',1.5)

%%
% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
line([15,20],[20,20],'Color',[0.5,0.5,0.5])
text(22,20,'50 percentile','Fontsize',fonts_ticks)
clear xticks
xticks([10,20,30,40,50,60,70,80].*0.5)
xticklabels({'5','10','15','20','25','30','35','40'})

xlim([10,40])
ylim([0,25])
ylabel('TTC at lane change [s]        ')
xlabel('Overtaken car speed [m s^{-1}]   ')
title('2f. Chen et al. (2015)')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='overtaking_on_TTC_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')