clear all
close all

%% ------------------
load('trial_all.mat');
% plotting_details
x_width=8 ;y_width=3; % figure dimensions (cms)
fonts=8; % fontsize of x and y labels
fonts_ticks=7;
% bins number
nbins=100;

% for Grass/Water - 8 noise
temp=[];
for ii_p=1:12 % 12 participants
        eval(sprintf('temp=[temp,trial_%03d]',20+((ii_p-1).*31)));
        eval(sprintf('temp=[temp,trial_%03d]',21+((ii_p-1).*31)));
end
figure(1)
subplot(2,1,1)
histogram(temp,nbins, 'Normalization', 'pdf','FaceColor',[0.5,0.5,0.5],...
    'EdgeColor','none');
% plot the grass and water
p1=patch([-350,-250,-250,-350],[0,0,0.01,0.01],'w');
p1.FaceColor=[0.5,0.5,0.5];p1.EdgeColor=[0.5,0.5,0.5];
p2=patch([350,250,250,350],[0,0,0.01,0.01],'k');
% text
t1=text(-300,0.005,'grass','FontSize',fonts_ticks,'Color',[1,1,1]);
t1.Rotation=0;
t1.HorizontalAlignment='center';
t2=text(300,0.005,'water','FontSize',fonts_ticks,'Color',[1,1,1]);
t2.Rotation=0;
t2.HorizontalAlignment='center';
ylabel('             Probability [-]')
xlabel('Lateral position [pixels]')
title('         4c. Dunning et al. (2015)')
xlim([-350,350])
ylim([0,0.01])
xticks([-350,-250,0,250,350])
xticklabels({'','-250','0','250',''})
set(gca,'XTickLabelRotation',0)
yticks([0.002,0.01])
% yticklabels({'0.0','0.01'})
yticklabels({'',''})
xlabel('Lateral deviation [pixel] ')
set(gca,'FontSize',fonts_ticks);
set(gca,'view',[90 -90])


%------------------------------------------------------------------------%
% for Water/Water - 8 noise
temp=[];
for ii_p=1:12 % 12 participants
        eval(sprintf('temp=[temp,trial_%03d]',28+((ii_p-1).*31)));
        eval(sprintf('temp=[temp,trial_%03d]',29+((ii_p-1).*31)));
end
figure(1)
subplot(2,1,2)
histogram(temp,nbins, 'Normalization', 'pdf','FaceColor',[0.5,0.5,0.5],...
    'EdgeColor','none')
% plot the grass and water
p3=patch([-350,-250,-250,-350],[0,0,0.01,0.01],'k');
p4=patch([350,250,250,350],[0,0,0.01,0.01],'k');
% text
t1=text(-300,0.005,'water','FontSize',fonts_ticks,'Color',[1,1,1]);
t1.Rotation=0;
t1.HorizontalAlignment='center';
t2=text(300,0.005,'water','FontSize',fonts_ticks,'Color',[1,1,1]);
t2.Rotation=0;
t2.HorizontalAlignment='center';

xlim([-350,350])
ylim([0,0.01])
xticks([-350,-250,0,250,350])
xticklabels({' ',' ',' ',' ',' '})
yticks([0,0.008])
% yticklabels({'0.0','0.01'})
yticklabels({'',''})
set(gca,'view',[90 -90])

% Dunning, Amber, et al. "The tuning of human motor response to risk in...
% a dynamic environment task." PloS one 10.4 (2015): e0125461.

 ha=get(gcf,'children');
 set(ha(2),'position',[.4 .15 .25 .65])
 set(ha(1),'position',[.65 .15 .25 .65])

set(gca,'FontSize',fonts_ticks);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_width/2 y_width]); 
name_string='asymmetric_on_latdev2_point_lit';
% saveas(gcf,name_string,'pdf')
% saveas(gcf,name_string,'png')
% saveas(gcf,name_string,'epsc')

