% Ransen 2005
% Table 5 (Speed)
clear all
close (figure(14001))
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;

P_No_onc_tr=[101.2;99.9;99.2;99.9]./3.6; % table is in kmph
P_Yes_onc_tr=[96.5;98.4;99.1;97.9]./3.6; % table is in kmph
P_No_onc_tr_sd=[12.3;10.5;8.9;9.6]./(2.*3.6); % table is in kmph
P_Yes_onc_tr_sd=[11.9;11.5;7.9;10.1]./(2.*3.6); % table is in kmph
% and lane width = 3.4m

marker_style={'o','d','s','*','x'};
for ii=1:1%length(P_No_onc_tr) % because i plot only 'before' condition
    figure(14001)
    hold on
    % Passenger cars
    errorbar([1,2],[P_No_onc_tr(ii),P_Yes_onc_tr(ii)],...
        [P_No_onc_tr_sd(ii),P_Yes_onc_tr_sd(ii)],'Color',[0.5,0.5,0.5])
    plot(1,P_No_onc_tr(ii),marker_style{ii},'MarkerSize',4,...
        'MarkerFaceColor',0.*[1,1,1],'MarkerEdgeColor',[0,0,0])
    plot(2,P_Yes_onc_tr(ii),marker_style{ii},'MarkerSize',4,...
        'MarkerFaceColor',0.*[1,1,1],'MarkerEdgeColor',[0,0,0])
end


figure(14001)
hold on
ylim([24,30.5])
yticks([24,26,28,30])
xlim([0,3])
% text
text(0.5,0.2,'road centre','fontsize',fonts_ticks)
text(0.5,0.75,'road edge','fontsize',fonts_ticks)
clear xticks
xticks([0,1,2,3])
xticklabels({'','absent  ','  present',''})
xlabel('Oncoming traffic')
ylabel('Min speed [m s^{-1}]')
title('3f. Räsänen (2005)')
% Räsänen, Mikko. "Effects of a rumble strip barrier line on lane keeping...
% in a curve." Accident Analysis & Prevention 37.3 (2005): 575-581.
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters oncoming_on_speed_point_rasanen
