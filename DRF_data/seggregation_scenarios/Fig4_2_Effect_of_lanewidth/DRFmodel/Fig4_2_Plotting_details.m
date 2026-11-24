x_width=4 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

figure(4) % SPEED
hold on
xlabel('Lane width [m]','Fontsize',fonts)
ylabel('Mean speed [m s^{-1}]  ','Fontsize',fonts)
xlim([2,4.5])
clear xticks
xticks([2.5,3.0,3.5,4.0])
xticklabels({'2.5','3.0','3.5','4.0'})
ylim([10,26])
clear yticks
yticks([10,15,20,25])
yticklabels({'10','15','20','25'})
title('2c. DRF model','FontSize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
%     print -dpdf -painters roadwidth_on_speed_point
%     saveas(gcf,'roadwidth_on_speed_point.png')

figure(5) % SDLP
hold on
xlabel('Lane width [m]','Fontsize',fonts)
ylabel('SDLP [m]','Fontsize',fonts)
xlim([2,4.5])
clear xticks
xticks([2.5,3.0,3.5,4.0])
xticklabels({'2.5','3.0','3.5','4.0'})
ylim([0,0.5])
clear yticks
yticks([0,0.15,0.3,0.45])
yticklabels({'0','0.15','0.30','0.45'})
title('2a. DRF model','FontSize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
%     print -dpdf -painters roadwidth_on_sdlp_point
%     saveas(gcf,'roadwidth_on_sdlp_point.png')