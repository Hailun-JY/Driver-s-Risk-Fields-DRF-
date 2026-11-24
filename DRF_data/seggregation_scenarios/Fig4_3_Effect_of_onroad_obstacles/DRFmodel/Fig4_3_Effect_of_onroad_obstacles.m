clc
clear all
close all
load('Fig4_3_Effect_of_onroad_obstacles.mat')
lw=1;
lstyle={'--','-'};
buffer_dist=100; % dist before and after obstacle
fonts_ticks=7;

figure(6)
hold on
Fig4_3_Plotting_obstacles
plot(x_latdev_traj_normal_1,...
    y_latdev_traj_normal_1,'Linewidth',lw,'Color',...
    [0.5,0.5,0.5],'LineStyle',lstyle{1})
plot(x_latdev_traj_normal_2,...
    y_latdev_traj_normal_2,'Linewidth',lw,'Color',...
    [0.5,0.5,0.5],'LineStyle',lstyle{2})
plot(x_latdev_traj_sport_1,...
    y_latdev_traj_sport_1,'Linewidth',lw,'Color',...
    [0,0,0],'LineStyle',lstyle{1});
plot(x_latdev_traj_sport_2,...
    y_latdev_traj_sport_2,'Linewidth',lw,'Color',...
    [0,0,0],'LineStyle',lstyle{2});
line([-buffer_dist,buffer_dist],[-1.75,-1.75],'LineWidth',2,'Color',[0,0,0])
line([-buffer_dist,buffer_dist],[ 1.75, 1.75],'LineWidth',2,'Color',[0,0,0])
line([0,0],[-2,2],'Linewidth',1,'Linestyle',':','Color',[0.65,0.65,0.65])
line([0+5,0+5],[-2,2],'Linewidth',1,'Linestyle',':','Color',[0.65,0.65,0.65])
% marking 'narrow' and 'wide' obstacles
line([5,20],[1.25,1.25],'color',[0.5,0.5,0.5])
text(25,1.25,'narrow obstacle','Fontsize',fonts_ticks-1)
line([5,20],[0.6,0.6],'color',[0.0,0.0,0.0])
text(25,0.6,'wide obstacle','Fontsize',fonts_ticks-1)


figure(7)
hold on
plot(x_speed_traj_normal_1,...
y_speed_traj_normal_1,'Linewidth',lw,'Color',...
[0.5,0.5,0.5],'LineStyle',lstyle{1})
plot(x_speed_traj_normal_2,...
y_speed_traj_normal_2,'Linewidth',lw,'Color',...
[0.5,0.5,0.5],'LineStyle',lstyle{2})
plot(x_speed_traj_sport_1,...
y_speed_traj_sport_1,'Linewidth',lw,'Color',...
[0,0,0],'LineStyle',lstyle{1})
plot(x_speed_traj_sport_2,...
y_speed_traj_sport_2,'Linewidth',lw,'Color',...
[0,0,0],'LineStyle',lstyle{2})
line([0,0],[0,30],'Linewidth',1,'Linestyle',':','Color',[0.65,0.65,0.65])
line([0+5,0+5],[0,30],'Linewidth',1,'Linestyle',':','Color',[0.65,0.65,0.65])


figure(8)
hold on
plot(x_owidth,y_min_latdev_normal,'o',...
    'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
plot(x_owidth,y_min_latdev_sport,'o',...
    'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])


figure(9)
hold on
plot(x_owidth,y_min_speed_normal,'o',...
    'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
plot(x_owidth,y_min_speed_sport,'o',...
    'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0.5,0.5,0.5])

Fig4_3_Plotting_details
