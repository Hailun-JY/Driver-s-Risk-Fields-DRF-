close all
clear all
load('he_2002_data.mat')
x_points=(10:10:100)./3.6;
y_points=median_thw(:,2);
y_err_top=abs(ptile75_thw(:,2)-median_thw(:,2));
y_err_bot=abs(ptile25_thw(:,2)-median_thw(:,2));
figure(3)
hold on
errorbar(x_points,y_points,y_err_bot,y_err_top,'color',[0.5,0.5,0.5])
plot(x_points,y_points,'o','MarkerEdgeColor',[0.0,0.0,0.0],...
    'MarkerSize',2,'MarkerFaceColor',[0.0,0.0,0.0])

% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear xticks
xticks([5,10,15,20,25,30])
xticklabels({'5','10','15','20','25','30'})

xlim([10,30])
ylim([0.5,3.5])
yticks([0.5,1,2,3])
yticklabels({'','1','2','3'})
ylabel('Time Headway_{pref} [s]        ')
xlabel('Lead car speed [m/s]')
title('1c. He et al. (2002)  ')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='carfollowing_on_thw_point_mps_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')


