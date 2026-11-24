clear all
close all

%% ------------------
load('time_all.mat')
% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
% bins number
nbins=100;

% for Grass/Water - 8 noise
temp_gw=[];
for ii_p=1:12 % 12 participants
        eval(sprintf('temp_gw=[temp_gw,time_%03d]',20+((ii_p-1).*31)));
        eval(sprintf('temp_gw=[temp_gw,time_%03d]',21+((ii_p-1).*31)));
end
temp_gw=temp_gw./1000; % milli seconds to seconds
%------------------------------------------------------------------------%
% for Water/Water - 8 noise
temp_ww=[];
for ii_p=1:12 % 12 participants
        eval(sprintf('temp_ww=[temp_ww,time_%03d]',28+((ii_p-1).*31)));
        eval(sprintf('temp_ww=[temp_ww,time_%03d]',29+((ii_p-1).*31)));
end
temp_ww=temp_ww./1000; % milli seconds to seconds
% xnames=
figure(1)
hold on
plot(1.*ones(1,length(temp_gw)),temp_gw,'o','MarkerFaceColor',[1,1,1],...
    'MarkerEdgeColor',[0.75,0.75,0.75],'MarkerSize',2)
plot(2.*ones(1,length(temp_ww)),temp_ww,'o','MarkerFaceColor',[1,1,1],...
    'MarkerEdgeColor',[0.75,0.75,0.75],'MarkerSize',2)
boxplot([temp_gw.',temp_ww.'],'Color',[0,0,0])

xticks([0.5,1,2,2.5])
xticklabels({'',' grass','water',''})
ylabel('Completion time [s]')
xlabel('water          water','FontSize',fonts_ticks-4)
title('4f. Dunning et al. (2015)')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='asymmetric_on_speed_point_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')

