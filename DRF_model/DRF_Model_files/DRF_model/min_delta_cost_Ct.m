function[ cost_Ct ]=min_delta_cost_Ct(delta_optim,phiv_a,tla,par1,cexp,v_inter_temp,...
                                    L,xv,yv,res,kexp1,kexp2,mcexp,Env,...
                                    ii,Ct,delta_fut_h,Pipe_sequence,Is,Obs_sequence,Os,dt,delta1,Car_Nrp_Idx)
    [ delta ]   = Gaussian_3d_torus_delta( delta_optim );
    [ phiv ]    = Gaussian_3d_torus_phiv( phiv_a );
    [ dla ]     = Gaussian_3d_torus_dla( tla,v_inter_temp );
    [ R ]       = Gaussian_3d_torus_R(L,delta);
    [ xc,yc ]   = Gaussian_3d_torus_xcyc(xv,yv,phiv,delta,R);
    [X,Y,xbl,xbu,ybl,ybu]=Gaussian_3d_torus_meshgrid(xv,yv,dla,res,Car_Nrp_Idx(ii));
    [ mexp1 ]    = Gaussian_3d_torus_mexp( kexp1,mcexp,delta,v_inter_temp,delta1,dt );
    [ mexp2 ]    = Gaussian_3d_torus_mexp( kexp2,mcexp,delta,v_inter_temp,delta1,dt );
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
    [ cost_Ct ]     = (cost_cur-1.1.*Ct).^2;% + (180./pi).*(delta_fut_h-delta_optim).^2;
end

