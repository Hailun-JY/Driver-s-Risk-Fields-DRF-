figure(13)
hold on
ylim([0,6])
xlabel('Distance travelled after lead car apeeared [m]')
ylabel('Time Headway [s]')
title('1a. DRF model')
clear yticks
yticks([0,2,4,6])
yticklabels({'0','2','4','6'})
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% print -dpdf -painters carfollowing_on_THW

figure(14)
hold on
ylim([0.5,3.5])
xlim([0,3])
clear xticks
xticks([0,1,2,3])
xticklabels({'','12.5','15.0',''})
clear yticks
yticks([0.5,1,2,3])
yticklabels({'','1','2','3'})
xlabel('Lead car speed [m s^{-1}]')
ylabel('Time Headway_{pref} [s]        ')
title('1b. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters carfollowing_on_THW_point

figure(15)
xlim([0,600])
xlabel('Distance travelled after lead car apeeared [m]')
ylabel('Speed [m s^{-1}]')
ylim([0,30])
yticks([0,15,30])
title('1d. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% print -dpdf -painters carfollowing_on_speed

figure(16)
xlim([5,15])
clear xticks
xticks([6,8.5,11,13.5])
xticklabels({'6.0','8.5','11.0','13.5'})
xlabel('Approach speed [m s^{-1}]')
ylabel(sprintf('Acceleration_{brake} [m s^{-2}]      '))
ylim([-6,0])
clear yticks
yticks([-6,-4,-2,0])
title('1e. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters carfollowing_on_decelBrake_approach_point