fcost = @(delta_optim)min_delta_cost(delta_optim,phiv_a,tla,par1,cexp,...
                                    v_inter_temp,L,xv,yv,res,kexp1,kexp2,mcexp,...
                                    Env,ii,Pipe_sequence,Is,Obs_sequence,Os,dt,delta1,Car_Nrp_Idx);
    
% -------------------------------------------------------------------------%
options = optimset('TolFun',1e-6);
[delta_cost_min,cost_min] = fminbnd(fcost,delta_fut_h-dstep_max,delta_fut_h+dstep_max,options);