max_cost=max([Os(:,6),Os(:,16)]);
for kk=1:length(Obs_sequence)
   if(Obs_sequence(kk)==1) % straight
        if(Car_Nrp_Idx(ii)>=Os(kk,8) && Car_Nrp_Idx(ii)<=Os(kk,9))
            [ p_x1,p_x2,p_x3,p_x4,p_y1,p_y2,p_y3,p_y4 ] = obstacle_straight_patch(Os,kk,dt,ii,kk);
            if (Os(kk,6)>=0); c_obs_str=[1,0,0];end % red
            if (Os(kk,6)< 0); c_obs_str=[0,1,0];end % blue
            patch([p_x1,p_x2,p_x3,p_x4],[p_y1,p_y2,p_y3,p_y4],c_obs_str);
        else
            % do nothing
        end
   elseif(Obs_sequence(kk)==0) % curved
        if(Car_Nrp_Idx(ii)>=Os(kk,18) && Car_Nrp_Idx(ii)<Os(kk,19))
            [ crv_vtr_ob_x,crv_vtr_ib_x,crv_vtr_ob_y,crv_vtr_ib_y ] = obstacle_curved_patch( Os,kk,dt,ii,kk);
            if (Os(kk,16)>=0); c_obs_crv=[1,0,0];end % red
            if (Os(kk,16)< 0); c_obs_crv=[0,1,0];end % blue
            patch([crv_vtr_ob_x,flip(crv_vtr_ib_x)],[crv_vtr_ob_y,flip(crv_vtr_ib_y)],c_obs_crv)  
        else
            % do nothing
        end
   else
       fprintf('Something went wrong in plotting obstacles\n')
       keyboard;
   end
end