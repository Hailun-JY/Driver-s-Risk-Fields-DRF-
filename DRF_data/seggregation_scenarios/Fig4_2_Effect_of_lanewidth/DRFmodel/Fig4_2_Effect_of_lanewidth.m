clear all
close all

load('Fig4_2_Effect_of_lanewidth.mat')

figure(4)
hold on
plot(x_roadwidth,y_speed_roadwidth_normal,'o',...
    'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
plot(x_roadwidth,y_speed_roadwidth_sport,'o',...
    'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])

figure(5)
hold on
plot(x_roadwidth,y_sdlp_normal,'o',...
    'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
plot(x_roadwidth,y_sdlp_sport,'o',...
    'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])

Fig4_2_Plotting_details