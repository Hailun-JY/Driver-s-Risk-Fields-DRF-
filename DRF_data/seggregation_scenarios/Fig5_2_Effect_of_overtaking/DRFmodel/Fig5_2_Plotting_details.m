figure(17)
l1=line([0,375],[1.75,1.75],'LineStyle',':','LineWidth',1,'Color',[0.25,0.25,0.25]);
l2=line([0,375],[-1.75,-1.75],'LineStyle','-','LineWidth',2,'Color',[0,0,0]);
l3=line([0,375],[5.25,5.25],'LineStyle','-','LineWidth',2,'Color',[0,0,0]);
text(240,4.25,'overtaking','Fontsize',fonts_ticks-1)
text(240,3.5,'lane','Fontsize',fonts_ticks-1)
text(240,0.7,'ego (default)','Fontsize',fonts_ticks-1)
text(240,-0.25,'lane','Fontsize',fonts_ticks-1)
ylim([-1.75,5.25])
xlim([0,300])
xlabel('Distance travelled after overtaken car appeared [m]')
ylabel('Lateral deviation [m] ')
title('2a. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% print -dpdf -painters overtaking3_on_latdev
% saveas(gcf,'overtaking3_on_latdev.png')

figure(18)
ylim([0,30])
yticks([0,15,30])
yticklabels({'0','15','30'})
xlim([0,300])
xlabel('Distance travelled after overtaken car appeared [m]')
ylabel('Speed [m s^{-1}]')
title('2d. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% saveas(gcf,'overtaking3_on_speed.png')
% print -dpdf -painters overtaking3_on_speed

figure(19)
clear xticks
xticks([0,1,2,3])
xticklabels({'','7.5','10',''})
xlim([0,3])
ylim([3,7])
yticks([3,5,7])
yticklabels({'3','5','7'})
xlabel('Overtaken car speed [m s^{-1}] ')
ylabel('TTC at lane change [s]      ')
title('2e. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters overtaking3_on_ttc_point
% saveas(gcf,'overtaking3_on_ttc_point.png')

figure(20)
clear xticks
xticks([0,1,2,3])
xticklabels({'','7.5','10',''})
xlim([0,3])
ylim([130,190])
clear yticks
yticks([130,150,170,190])
yticklabels({'130','150','170','190'})
xlabel('Overtaken car speed [m s^{-1}] ')
ylabel('Overtake distance [m]     ')
title('2b. DRF model')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters overtaking3_on_dist_point
% saveas(gcf,'overtaking3_on_dist_point.png')