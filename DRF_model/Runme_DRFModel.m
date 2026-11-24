
clc
clear all
close all
disp('Please make sure you are opening this file from its folder!')
cd ..\
addpath(genpath('DRF_model'))
cd DRF_model
DRF_simulation_parameters
F(N) = struct('cdata',[],'colormap',[]);% movie initialization
global Trigger_obs
Trigger_obs=zeros(length(Obs_sequence),N);
tic
for ii=1:N
    fprintf('%d: ',ii)
    % ---------- STAGE 1 ---------- %
    % updating dynamic states
    delta_a=Delta(ii);
    phiv_a=Phiv(ii);
    xv=Xv(ii);
    yv=Yv(ii);
    v=V(ii);
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    lat_dev = lat_dev_calc( xv,yv,phiv,circuit_x_lc,circuit_y_lc,...
                wh,Pipe_sequence,Is );
    Lat_Dev(ii)=lat_dev;
    Car_Nrp_Idx(ii)= car_nrp_idx_calc( xv,yv,phiv,circuit_x_lc,circuit_y_lc);
    
        
    %-----STR: to detect the ii (step) for dynamic obstacles ----%
     for trigger_ii=1:length(Obs_sequence)
        if(Obs_sequence(trigger_ii)==1) % straight obstacles
            n_str_temp=Os(trigger_ii,8);
            n_end_temp=Os(trigger_ii,9);
        end
        if(Obs_sequence(trigger_ii)==0) % curved obstacles
            n_str_temp=Os(trigger_ii,18);
            n_end_temp=Os(trigger_ii,19);
        end
        if(Car_Nrp_Idx(ii)>=n_str_temp && Car_Nrp_Idx(ii)<n_end_temp)
            Trigger_obs(trigger_ii,ii)=1;
        end
     end
    
    % ---------- STAGE 2 -----------%
    % Simulating the car kinematics 
    [ delta ]   = Gaussian_3d_torus_delta( delta_a );
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    [xvk1,yvk1,phiv_ak1] = carkin(xv,yv,phiv,v,delta,dt,L);   
    Xv(ii+1)=xvk1;
    Yv(ii+1)=yvk1;
    Phiv(ii+1)=phiv_ak1;
    
    % ---------- STAGE 3 ---------- %
    % calculate the steering by heading controller (delta_fut_h)
    [ delta ]   = Gaussian_3d_torus_delta( delta_a );
    delta1=delta;
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    [ dla ]     = Gaussian_3d_torus_dla( tla_h,v );
    [ R ]       = Gaussian_3d_torus_R(L,delta);
    [ xc,yc ]   = Gaussian_3d_torus_xcyc(xv,yv,phiv,delta,R);
    [ xvf,yvf,phivf ]   = heading_controller_xvfyvf(xc,yc,R,xv,yv,delta,dla);
    [  phirf ]          = Heading_circuit_road_solo( xvf,yvf,wh,Pipe_sequence,Is );
    [ phidiff ]         = heading_controller_phidiff(phirf,phivf);
    [ delta_fut_h ]     = delta_a+kh.*phidiff;
    Xvf(ii)=xvf;
    Yvf(ii)=yvf;
    Phivf(ii)=phivf;
    Delta_h(ii)=delta_fut_h;

    plot_carstate % plot the state of the car
    
    % ---------- STAGE 4 ---------- %
    % what is the cost incurred by this suggestion
    [ delta ]   = Gaussian_3d_torus_delta( delta_fut_h );
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    [ dla ]     = Gaussian_3d_torus_dla( tla,v );
    [ R ]       = Gaussian_3d_torus_R(L,delta);
    [ xc,yc ]   = Gaussian_3d_torus_xcyc(xv,yv,phiv,delta,R);
    [X,Y,xbl,xbu,ybl,ybu]=Gaussian_3d_torus_meshgrid(xv,yv,dla,res,Car_Nrp_Idx(ii));
    [ mexp1 ]    = Gaussian_3d_torus_mexp( kexp1,mcexp,delta,v,delta1,dt );
    [ mexp2 ]    = Gaussian_3d_torus_mexp( kexp2,mcexp,delta,v,delta1,dt );
    [ arc_len ] = Gaussian_3d_torus_arclen(X,Y,xv,yv,delta,xc,yc,R);
    [ a ]       = Gaussian_3d_torus_a(arc_len,par1,dla);
    [ sigma1 ]   = Gaussian_3d_torus_sigma(arc_len,mexp1,cexp);
    [ sigma2 ]   = Gaussian_3d_torus_sigma(arc_len,mexp2,cexp);
    [ Z_cur ]       = Gaussian_3d_torus_z(X,Y,xc,yc,R,a,sigma1,sigma2);
    [ Zroad_cur ]   = Generate_circuit_road_solo_cost( X,Y,Env,Pipe_sequence,Is );  
    [ Zobs_cur ]    = Obstacle_cost( X,Y, Obs_sequence,Os,ii,dt,Car_Nrp_Idx);
    [ Zenv_cur ]    = Zroad_cur + Zobs_cur;
    [ Zcost_cur ]   = Z_cur.*Zenv_cur;
    [ cost_cur ]    = sum(Zcost_cur(:)).*(res.^2);
       
    % ---------- STAGE 4 ---------- %
    % correct the heading controller
    DRF_simulation_stage 
    plot_ZcostCur 
    DRF_filter_fut_inputs_zero
    % Future inputs
    V(ii+1)=v_fut;
    Delta(ii+1)=delta_fut;
    Risk(ii)=cost_cur;
    pause(0.01)
    F(ii)=getframe(fig_h); 
end
 toc      
