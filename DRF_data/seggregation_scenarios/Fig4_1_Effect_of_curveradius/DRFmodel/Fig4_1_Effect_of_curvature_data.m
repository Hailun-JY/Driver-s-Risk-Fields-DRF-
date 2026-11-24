close all
clear all
clc

load('Fig4_1_Effect_of_curvature_data.mat')

figure(2)
hold on
plot(x_curve_radius,y_ttr_normal,'o',...
'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])

figure(2)
hold on
plot(x_curve_radius,y_ttr_sport,'o',...
'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0])

figure(3)
hold on
plot(x_curve_radius,y_speed_curve_centre_normal,'o',...
        'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor',[0.5,0.5,0.5])
    
figure(3)
hold on
plot(x_curve_radius,y_speed_curve_centre_sport,'o',...
        'MarkerFaceColor',[0.0,0.0,0.0],'MarkerEdgeColor','k')
    
Fig4_1_Plotting_details