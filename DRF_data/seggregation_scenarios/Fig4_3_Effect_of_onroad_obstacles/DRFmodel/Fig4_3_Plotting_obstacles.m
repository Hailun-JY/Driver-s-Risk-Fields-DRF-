figure(6)
% obstacles (plotting is reversed)
obs_place_x=[500,4400]; % define where the obstacles are placed
obs_place_y=[1100,2300];
c_l=5;% car length
c_w=1.8; % car width
obs_pos_x=[500,4400.65];
obs_pos_y=[1101.05,2300];
for ii_owidth=1:2
if(ii_owidth==1) % wide
patch([0,0+c_l,0+c_l,0],...
[1.251-0.9,1.251-0.9,1.251+0.9,1.251+0.9],'black')
elseif(ii_owidth==2)% narrow
h=patch([0,0+c_l,0+c_l,0],...
[1.75-0.9,1.75-0.9,1.75+0.9,1.75+0.9],'k');
h.FaceColor=[0.5,0.5,0.5];
h.EdgeColor=[0.5,0.5,0.5];
end
end