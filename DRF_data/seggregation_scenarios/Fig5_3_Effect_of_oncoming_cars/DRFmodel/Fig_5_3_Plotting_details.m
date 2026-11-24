% lateral deviaiton
figure(602)
hold on
line([0,0],[-2,2],'LineStyle',':','Color',[0.5,0.5,0.5],'Linewidth',1) 
ylim([0,1])
xlim([-25,25])
xlabel('Distance to passing the oncoming car [m]')
ylabel('Lateral deviation [m]')
title('3a. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% print -dpdf -painters oncoming_on_latdev


% speed
figure(603)
hold on
line([0,0],[-30,30],'LineStyle',':','Color',[0.5,0.5,0.5],'LineWidth',1) 
ylim([0,30])
xlim([-25,25])
xlabel('Distance to passing the oncoming car [m]')
ylabel('Speed [m s^{-1}]')
title('3d. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% print -dpdf -painters oncoming_on_speed

% lateral deviaiton point
figure(604)
hold on
ylim([0.0,0.7])
yticks([0,0.2,0.4,0.6])
xlim([-0.5,2.5])
text(0.6,0.25+0.45,'oncoming','FontSize',fonts_ticks-1)
text(0.6,0.25+0.375,'lane','FontSize',fonts_ticks-1)
line([2,2],[0.525,0.625],'Color','k')
plot(2,0.625,'^','MarkerFaceColor',[0,0,0],'MarkerEdgeColor','none')
text(0.0,0.15,'road','FontSize',fonts_ticks-1)
text(0.0,0.075,'boundary','FontSize',fonts_ticks-1)
line([-0.25,-0.25],[0.1,0.2],'Color','k')
plot(-0.25,0.1,'v','MarkerFaceColor',[0,0,0],'MarkerEdgeColor','none')
clear xticks
xticks([-1,0,1,2,3])
xticklabels({'','absent','centre','offset',''})
xlabel('Oncoming traffic')
ylabel('Min lat deviation [m]  ')
title('3b. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters oncoming_on_latdev_point

% speed point
figure(605)
hold on
ylim([0,30])
xlim([-0.5,2.5])
clear xticks
xticks([-1,0,1,2,3])
xticklabels({'','absent','centre','offset',''})
xlabel('Oncoming traffic')
ylabel('Min speed [m s^{-1}]')
title('3e. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters oncoming_on_speed_point
