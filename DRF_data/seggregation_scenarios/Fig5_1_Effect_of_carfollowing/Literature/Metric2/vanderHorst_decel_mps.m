clear all
close all
load('vanderHorst_2004_decel.mat')

x_speed=[30,50,70]./3.6;

figure(1)
hold on
plot(x_speed,occ_no_normal(:,2),'x','MarkerFaceColor',[0.0,0.0,0.0],...
    'MarkerEdgeColor',[0.0,0.0,0.0],'MarkerSize',4)
plot(x_speed,occ_no_normal(:,2),'k--')
plot(x_speed,occ_no_hard(:,2),'x','MarkerFaceColor',[0.0,0.0,0.0],...
    'MarkerEdgeColor',[0.0,0.0,0.0],'MarkerSize',4)
plot(x_speed,occ_no_hard(:,2),'k')

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
line([5,10],[-0.75,-0.75],'LineStyle','--','Color','k')
line([5,10],[-1.3,-1.3],'LineStyle','-','Color','k')
text(12,-0.75,'Normal braking','FontSize',fonts_ticks-1)
text(12,-1.3,'Hard braking','FontSize',fonts_ticks-1)
clear xticks
xticks([5,10,15,20,25])
xticklabels({'5','10','15','20','25'})
xlim([0,25])
ylim([-6,-0])
clear yticks
yticks([-6,-4,-2,0])
xlabel('Approach speed [m/s]')
ylabel('Acceleration_{brake} [m/s^{2}]      ')
title('1f. van der Horst (2004)')
% van der Horst, Richard. "Occlusion as a measure for visual workload: ...
% an overview of TNO occlusion research in car driving. ...
% " Applied Ergonomics 35.3 (2004): 189-196.
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='carfollowing_on_decel_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')
