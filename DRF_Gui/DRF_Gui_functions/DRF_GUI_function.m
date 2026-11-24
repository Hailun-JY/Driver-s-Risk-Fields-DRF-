function [  ] = DRF_GUI_function(handles)
%DRF_GUI_FUNCTION 

% What is the cost incurred by this suggestion
Sr=54; L=5; res=1;
xv          =0;
yv          =0;


% sbk : displaying the Human perception image
handles.I2 = imread('Human_perception.jpg');
axes(handles.axes2);
imshow(handles.I2);
% sbk : displaying the Perceived risk image
handles.I3 = imread('Perceived_risk.jpg');
axes(handles.axes3);
imshow(handles.I3);

% ----- Car state sliders ----- %
% Steering angle slider
range_sa=[-179,180];
[ slider_sa ] = DRF_GUI_slider(range_sa,handles.slider_sa,handles.text_sa_value);
delta_fut_h =(pi./180).*slider_sa./Sr;
% Heading angle slider
range_phi=[45,135];
[ slider_phi ] = DRF_GUI_slider(range_phi,handles.slider_phi,handles.text_phi_value);
phiv_a =(pi./180).*slider_phi;
% Speed slider
range_v=[0,20];
[ slider_v ] = DRF_GUI_slider(range_v,handles.slider_v,handles.text_v);
v =slider_v;

% ----- DRF parameter sliders ----- %
% p slider
range_p=[0,0.5];
[ slider_p ] = DRF_GUI_slider(range_p,handles.slider_p,handles.text_p_value);
par1 =slider_p;
% tla slider
range_tla=[0.5,5];
[ slider_tla ] = DRF_GUI_slider(range_tla,handles.slider_tla,handles.text_tla_value);
tla =slider_tla;
% m slider
range_m=[0.01,0.5];
[ slider_m ] = DRF_GUI_slider(range_m,handles.slider_m,handles.text_m_value);
mcexp =slider_m;
% c slider
range_c=[0.1,5];
[ slider_c ] = DRF_GUI_slider(range_c,handles.slider_c,handles.text_c_value);
cexp =slider_c;
% k1 slider
range_k1=[-5,5];
[ slider_k1 ] = DRF_GUI_slider(range_k1,handles.slider_k1,handles.text_k1_value);
kexp1 =slider_k1;
% k2 slider
range_k2=[-5,5];
[ slider_k2 ] = DRF_GUI_slider(range_k2,handles.slider_k2,handles.text_k2_value);
kexp2 =slider_k2;


[ delta ]   = Gaussian_3d_torus_delta( delta_fut_h );
[ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
[ dla ]     = Gaussian_3d_torus_dla( tla,v );
[ R ]       = Gaussian_3d_torus_R(L,delta);
[ xc,yc ]   = Gaussian_3d_torus_xcyc(xv,yv,phiv,delta,R);
[X,Y,xbl,xbu,ybl,ybu]=Gaussian_3d_torus_meshgrid(xv,yv,dla,res);
[ mexp1 ]    = Gaussian_3d_torus_mexp( kexp1,mcexp,delta,v );
[ mexp2 ]    = Gaussian_3d_torus_mexp( kexp2,mcexp,delta,v );
[ arc_len ] = Gaussian_3d_torus_arclen(X,Y,xv,yv,delta,xc,yc,R);
[ a ]       = Gaussian_3d_torus_a(arc_len,par1,dla);
[ sigma1 ]   = Gaussian_3d_torus_sigma(arc_len,mexp1,cexp);
[ sigma2 ]   = Gaussian_3d_torus_sigma(arc_len,mexp2,cexp);
[ Z_cur ]   = Gaussian_3d_torus_z(X,Y,xc,yc,R,a,sigma1,sigma2);

% creating background just blue
xlim1=-50; xlim2=50;
ylim1=-20; ylim2=80;
Xbgv=xlim1:res:xlim2;
Ybgv=ylim1:res:ylim2;
[Xbg,Ybg]=meshgrid(Xbgv,Ybgv);

% creating abstracted ground truth
rw=30; % road width
tree=5; % cost of tree
car=2.5;
cw=15; cl=20; % car width and length
x_car=0; % lateral position of car
y_car=40; % longitudinal posiiton of car
Right_road_bg =(sign(Xbg-rw/2)+1)./2;
Right_road    =(sign(X-rw/2)+1)./2;
Left_road_bg  =(sign(-Xbg-rw/2)+1)./2;
Left_road     =(sign(-X-rw/2)+1)./2;
% trees
Left_tree_bg=(sign(-Xbg-rw/2)+1)./2;
Left_tree   =(sign(-X-rw/2)+1)./2;
% obstacle car
Left_car_bg  =(sign(-Xbg+cw/2)+1)./2;
Left_car     =(sign(-X+cw/2)+1)./2;
Right_car_bg  =(sign(Xbg+cw/2)+1)./2;
Right_car     =(sign(X+cw/2)+1)./2;
Top_car_bg  =(sign(-Ybg+cl/2+y_car)+1)./2;
Top_car     =(sign(-Y+cl/2+y_car)+1)./2;
Bottom_car_bg  =(sign(Ybg+cl/2-y_car)+1)./2;
Bottom_car     =(sign(Y+cl/2+1-y_car)+1)./2;

% Radiobutton for tree and car
car_on=get(handles.radiobutton_car,'Value');
tree_on=get(handles.radiobutton_tree,'Value');

if(car_on==1 && tree_on==1)
handles.I1 = imread('Ground_truth_full.jpg');axes(handles.axes1);imshow(handles.I1);
elseif(car_on==1 && tree_on==0)
handles.I1 = imread('Ground_truth_car.jpg');axes(handles.axes1);imshow(handles.I1);
elseif(car_on==0 && tree_on==1)
handles.I1 = imread('Ground_truth_tree.jpg');axes(handles.axes1);imshow(handles.I1);
else
handles.I1 = imread('Ground_truth_empty.jpg');axes(handles.axes1);imshow(handles.I1);
end   

Scene_cost=Left_road+Right_road+tree_on.*tree.*Left_tree+...
           car_on.*car.*Left_car.*Right_car.*Top_car.*Bottom_car;
Scene_cost_bg=Left_road_bg+Right_road_bg+tree_on.*tree.*Left_tree_bg+...
              car_on.*car.*Left_car_bg.*Right_car_bg.*Top_car_bg.*Bottom_car_bg;

% plotting abstracted version of ground truth in GUI
axes(handles.axes4)
cla
hold on
surf(Xbg,Ybg,Scene_cost_bg,'linestyle','none') % DRF
caxis([0 1.5*tree])
% surf(Xbg,Ybg,0.*Xbg,'linestyle','none')% just for blue background
clear xticks
xticklabels({''})
clear yticks
yticklabels({''})
xlim([xlim1,xlim2])
ylim([ylim1,ylim2])
view(0,90)

% plotting DRF in GUI
axes(handles.axes5)
cla
hold on
surf(X,Y,Z_cur,'linestyle','none') % DRF
surf(Xbg,Ybg,0.*Xbg,'linestyle','none')% just for blue background
caxis([0 1000])
clear xticks
xticklabels({''})
clear yticks
yticklabels({''})
xlim([xlim1,xlim2])
ylim([ylim1,ylim2])
view(0,90)

% plotting quantified perceived risk in GUI
axes(handles.axes6)
cla
hold on
surf(X,Y,Z_cur.*Scene_cost,'linestyle','none') % DRF
surf(Xbg,Ybg,0.*Xbg,'linestyle','none')% just for blue background
caxis([0 1.5*tree*1000])
clear xticks
xticklabels({''})
clear yticks
yticklabels({''})
xlim([xlim1,xlim2])
ylim([ylim1,ylim2])
view(0,90)


% QUANTIFIED PERCEIVED RISK
z=(Z_cur.*Scene_cost);
qpr=sum(z(:));
textLabel = sprintf('%.2f',qpr);
set(handles.text_QPR, 'String', textLabel);
end

