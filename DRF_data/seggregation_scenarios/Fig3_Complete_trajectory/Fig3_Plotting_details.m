fonts_ticks=7;
x_width=17;
y_width=10;

figure(1)
subplot(2,1,1)
line([2914,2914],[-100,100],'color',[0.5,0.5,0.5],'linestyle','-.')
xlim([0,12120])
yyaxis left
ylim([0,30])
ylabel('Speed [m s^{-1}]','Fontsize',fonts_ticks)
yyaxis right
ylim((20+[-30,20]).*1e-3)
ylabel('Curvature [m^{-1}]','Fontsize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);

subplot(2,1,2)
line([2914,2914],[-100,100],'color',[0.5,0.5,0.5],'linestyle','-.')
xlim([0,12120])
ylim([-2,5.5])
ylabel(sprintf('Lateral deviation [m]'),'Fontsize',fonts_ticks)
xlabel('Longitudinal distance [m]','Fontsize',fonts_ticks)
set(gca,'FontSize',fonts_ticks);

set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
% print -dpdf -painters complete_trajectory

%% Plotting an external Legend %%
close (figure(2))
figure(2)
hold on
plot(1:100,'b','linewidth',2)
plot(1:100,'r','linewidth',2)
plot(1:100,'b','linewidth',2,'linestyle',':')
plot(1:100,'r','linewidth',2,'linestyle',':')
patch([0,1,1,0],[0,0,1,1],'blue','FaceAlpha',0.5)
patch([0,1,1,0],[0,0,1,1],'red','FaceAlpha',0.5)
legend({'DRF model normal','DRF model sport','Experiment normal',...
    'Experiment sport','Experiment normal +/- 2\sigma','Experiment sport +/- 2\sigma'})
% print -dpdf -painters complete_trajectory_legend