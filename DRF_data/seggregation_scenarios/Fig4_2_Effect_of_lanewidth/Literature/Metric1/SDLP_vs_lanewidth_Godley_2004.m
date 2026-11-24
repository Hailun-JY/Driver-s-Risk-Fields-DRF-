close all
load('SDLP_Godley2004.mat')

% ---- I flipped the x axis ---- %
x_bar=[0.5,1.5,2.5];
y_error(1)=(SDLP_std(1,2)-SDLP_std(2,2))./2;
y_error(2)=(SDLP_std(3,2)-SDLP_std(4,2))./2;
y_error(3)=(SDLP_std(5,2)-SDLP_std(6,2))./2;

figure(5)
hold on
bar(x_bar,SDLP_mean(3:-1:1,2),'FaceColor',[0.5,0.5,0.5],'EdgeColor',...
    [0,0,0],'BarWidth', 0.5)
errorbar(x_bar,SDLP_mean(3:-1:1,2),y_error(3:-1:1),'LineStyle','none','Color',[0,0,0])


% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

clear xticks
xticks([0.5,1.5,2.5])
% xticklabels({'narrow(2.5m)','medium(3.0m)','wide(3.6m)'})
xticklabels({'2.5','3.0','3.6'})
xlim([0,3])
ylim([0.0,0.3])
yticks([0,0.15,0.3])
yticklabels({'0','0.15','0.30'})
title('2b. Godley et al. (2004)')
% Godley, Stuart T., Thomas J. Triggs, and Brian N. Fildes. ...
% "Perceptual lane width, wide perceptual road centre markings and ...
% driving speeds." Ergonomics 47.3 (2004): 237-256.
ylabel('SDLP [m]')
xlabel('Lane width [m]')
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='roadwidth_on_sdlp_point_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')

