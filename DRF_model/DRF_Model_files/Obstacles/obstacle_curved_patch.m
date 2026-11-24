function [ crv_vtr_ob_x,crv_vtr_ib_x,crv_vtr_ob_y,crv_vtr_ib_y ] = obstacle_curved_patch( Os,kk,dt,ii,jj )
%OBSTACLE_CURVED_PATCH Summary of this function goes here
%   Detailed explanation goes here

        crv_x1=Os(kk,10); crv_y1=Os(kk,11);
        crv_ts=Os(kk,12); crv_te=Os(kk,13);
        crv_w=Os(kk,14);  crv_R=Os(kk,15);
        crv_l=crv_R.*abs(crv_ts-crv_te);
        crv_l_res=0.1;% length resolution
        crv_t_res=sign(crv_te-crv_ts).*crv_l_res./crv_R; % theta_resolution
        crv_t_vtr=crv_ts:crv_t_res:crv_te;
        [crv_xc,crv_yc]= generate_heading_curve_center( crv_x1,crv_y1,crv_R,crv_ts );
        crv_vtr_ib_x=crv_xc+(crv_R-crv_w/2).*cos(crv_t_vtr);
        crv_vtr_ob_x=crv_xc+(crv_R+crv_w/2).*cos(crv_t_vtr);
        crv_vtr_ib_y=crv_yc+(crv_R-crv_w/2).*sin(crv_t_vtr);
        crv_vtr_ob_y=crv_yc+(crv_R+crv_w/2).*sin(crv_t_vtr);
        
end

