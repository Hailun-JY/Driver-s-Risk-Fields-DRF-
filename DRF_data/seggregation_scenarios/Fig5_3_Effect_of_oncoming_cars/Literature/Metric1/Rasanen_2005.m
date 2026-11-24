% Ransen 2005
% Table 3
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
close (figure(14000))

% Mean
P_No_onc_tr_original=[37.2;40.5;32.0;36.5]./100; % table is in cms
P_Yes_onc_tr_original=[58.2;63.4;52.0;54.8]./100; % table is in cms
% original dimensions were measured from the left tyre of the car
P_No_onc_tr_adjust_car_width=P_No_onc_tr_original+1.8/2; % assumed a carwidth of 1.8m
P_Yes_onc_tr_adjust_car_width=P_Yes_onc_tr_original+1.8/2; % assumed a carwidth of 1.8m
% Adjust for lane width centre
% lane width =3.4m (Fig. 1 of Ransen)
P_No_onc_tr=(3.4/2-P_No_onc_tr_adjust_car_width); % -ve sign to match my convention
P_Yes_onc_tr=(3.4/2-P_Yes_onc_tr_adjust_car_width); % right of lane center is -ve

% SD
P_No_onc_tr_original_sd=[35.3;22.7;23.8;22.0]./100; % table is in cms
P_Yes_onc_tr_original_sd=[26.4;28.9;30.9;24.5]./100; % table is in cms
% original dimensions were measured from the left tyre of the car
P_No_onc_tr_adjust_car_width_sd=P_No_onc_tr_original_sd+1.8/2; % assumed a carwidth of 1.8m
P_Yes_onc_tr_adjust_car_width_sd=P_Yes_onc_tr_original_sd+1.8/2; % assumed a carwidth of 1.8m
% Adjust for lane width centre
% lane width =3.4m (Fig. 1 of Ransen)
P_No_onc_tr_sd=(3.4/2-P_No_onc_tr_adjust_car_width_sd)./4; % -ve sign to match my convention
P_Yes_onc_tr_sd=(3.4/2-P_Yes_onc_tr_adjust_car_width_sd)./4; % right of lane center is -ve

marker_style={'o','d','s','*','x'};
for ii=1:1%length(P_No_onc_tr)
    figure(14000)
    hold on
    errorbar([1,2],[P_No_onc_tr(ii),P_Yes_onc_tr(ii)],...
        [P_No_onc_tr_sd(ii),P_Yes_onc_tr_sd(ii)],'Color',[0.5,0.5,0.5])
    plot(1,P_No_onc_tr(ii),marker_style{ii},'MarkerSize',4,...
        'MarkerFaceColor',0.*[1,1,1],'MarkerEdgeColor',[0,0,0])
    plot(2,P_Yes_onc_tr(ii),marker_style{ii},'MarkerSize',4,...
        'MarkerFaceColor',0.*[1,1,1],'MarkerEdgeColor',[0,0,0])
end


figure(14000)
hold on
ylim([0.0,0.7])
yticks([0,0.2,0.4,0.6])
xlim([0,3])
% text
text(0.5,0.15,'road','fontsize',fonts_ticks-1)
text(0.5,0.075,'boundary','fontsize',fonts_ticks-1)
text(0.95,0.25+0.45,'oncoming','fontsize',fonts_ticks-1)
text(0.95,0.25+0.375,'lane','FontSize',fonts_ticks-1)
line([0.25,0.25],[0.1,0.2],'Color',[0,0,0])
plot(0.25,0.1,'v','MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])
line([2.5,2.5],[0.525,0.625],'Color',[0,0,0])
plot(2.5,0.625,'^','MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])
clear xticks
xticks([0,1,2,3])
xticklabels({'','absent  ','  present',''})
xlabel('Oncoming traffic')
ylabel('Min lat deviation [m]    ')
title('3c. Räsänen (2005)')
% Räsänen, Mikko. "Effects of a rumble strip barrier line on lane keeping...
% in a curve." Accident Analysis & Prevention 37.3 (2005): 575-581.
set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
% print -dpdf -painters oncoming_on_latdev_point_rasanen
