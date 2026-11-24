figure(9)
xlabel('Distance [m]')
ylabel(sprintf('Speed [m s^{-1}]'))
title('4d. DRF model','FontSize',fonts)
ylim([0,30])
yticks([0,10,20,30])
yticklabels({'0','10','20','30'})
xlim([100,150])
xticks([100,110,120,130,140,150])
xticklabels({'100','110','120','130','140','150'})
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters asymsym_on_speed

figure(10)
xlim([100,150])
xticks([100,110,120,130,140,150])
xticklabels({'100','110','120','130','140','150'})
ylim([-0.55,0.1])
yticks([-0.5,-0.25,0])
yticklabels({'-0.5','-0.25','0.0'})
xlabel('Distance [m]')
ylabel('Lateral deviation [m]')
title('4a. DRF model','FontSize',fonts)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters asymsym_on_latdev
%     saveas(gcf,'asymsym_on_latdev.png')

figure(11)
clear xticks xticklabels
xticks([0,1,2,3])
xlim([0.5,2.5])
ylim([10,30])
yticks([10,20,30])
yticklabels({'10','20','30'})
xticklabels({'','Asymmetric  ','  Symmetric',''})
xlabel('Parking')
ylabel(sprintf('Mean speed [m s^{-1}]'))
title('4e. DRF model','FontSize',fonts)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]);
% print -dpdf -painters asymsym_on_speed_point

figure(12)
xticks([0,1,2,3])
xticklabels({'','Asymmetric  ','  Symmetric',''})
xlim([0.5,2.5])
ylim([-0.5,0.1])
yticks([-0.5,-0.25,0.0])
yticklabels({'-0.5','-0.25','0.0'})
xlabel('Parking')
ylabel('Mean lat deviation [m]   ')
title('4b. DRF model','FontSize',fonts)
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]);
% print -dpdf -painters asymsym_on_latdev_point
