clc
x_width=4 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

figure(2)
hold on
xlabel('Curve radius [m]','Fontsize',fonts)
ylabel('TTR [%]','Fontsize',fonts)
xlim([0,500])
ylim([0,60])
clear yticks
yticks([30,60])
yticklabels({'30','60'})
title('1a. DRF model','FontSize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters curvature_on_TTR_points

figure(3)
xlabel('Curve radius [m]','Fontsize',fonts)
ylabel('Speed_{curve centre} [m s^{-1}]    ','Fontsize',fonts)
title('1c. DRF model','Fontsize',fonts)
xlim([0,500])
ylim([10,30])
clear yticks
yticks([10,20,30])
yticklabels({'10','20','30'})
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters curvature_on_speed