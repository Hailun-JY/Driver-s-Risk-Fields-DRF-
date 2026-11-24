function [ car_nrp_idx ] = car_nrp_idx_calc( xv,yv,phiv,circuit_x_lc,circuit_y_lc)
%CAR_NRP_IDX 
% This function clculates the nearest road point index

[dist_vctr] = sqrt( (circuit_x_lc-xv).^2 + (circuit_y_lc-yv).^2 );
[car_nrp_idx] = find(dist_vctr==min(dist_vctr),1);

end

