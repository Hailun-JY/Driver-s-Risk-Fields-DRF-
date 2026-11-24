
if(cost_cur<=Ct && v<=Vdes)
    cost_min=cost_cur;
    % velocity update
    dv=min(abs(kv.*(Vdes-v)),dVmax);
    v_fut=v+(sign(Vdes-v)).*dv;
    % steering angle update
    ds=min(abs(delta_fut_h-delta_a),dSmax);  
    delta_fut=delta_a+sign(delta_fut_h-delta_a).*ds;
    fprintf('1: cost_cur=%.2f <= %.0f && v=%.2f <= %.2f\n',cost_cur,Ct,v,Vdes)

elseif(cost_cur>Ct && v<=Vdes)
     cost_min=cost_cur;
     v_inter_temp=v;
     DRF_simulation_delta_cost_min % check if steering can reduce the cost below Ct
     if(cost_min>Ct)
        % steering angle update
        ds=min(abs(delta_cost_min-delta_a),dSmax);  
        delta_fut=delta_a+sign(delta_cost_min-delta_a).*ds;
        % velocity update
        dv=min(abs(kvc.*(Ct-cost_min)),dVmax);
        v_fut=v+(sign(Ct-cost_min)).*dv; % you slow down or speed up depending on cost_min
        fprintf('2.1 : cost_cur=%.2f > %.0f && v=%.2f <= %.2f\n',cost_cur,Ct,v,Vdes)
     elseif(cost_min<=Ct)
         dv=min(abs(kv.*(Vdes-v)),dVmax);
         v_fut=v+(sign(Vdes-v)).*dv;
         v_inter_temp=v_fut;
         DRF_simulation_delta_cost_min_Ct
         % steering angle update
         ds=min(abs(delta_cost_min-delta_a),dSmax);  
         delta_fut=delta_a+sign(delta_cost_min-delta_a).*ds;
         fprintf('2.2 : cost_cur=%.2f > %.0f && v=%.2f <= %.2f\n',cost_cur,Ct,v,Vdes)
     else
         fprintf('Error in stage:condition 2\n')
     end


elseif(cost_cur<=Ct && v>Vdes)
    cost_min=cost_cur;
    % steering angle update
    ds=min(abs(delta_fut_h-delta_a),dSmax);  
    delta_fut=delta_a+sign(delta_fut_h-delta_a).*ds;
    dv=min(abs(kv.*(Vdes-v)),dVmax);
    v_fut=v+(sign(Vdes-v)).*dv;
    fprintf('3 : cost_cur=%.2f <= %.0f && v=%.2f > %.2f\n',cost_cur,Ct,v,Vdes)
    
elseif(cost_cur>Ct && v>Vdes)
    cost_min=cost_cur;
    dv=min(abs(kv.*(Vdes-v)),dVmax);
    v_fut=v+(sign(Vdes-v)).*dv;
    v_inter_temp=v_fut;
    DRF_simulation_delta_cost_min_Ct
    % steering angle update
    ds=min(abs(delta_cost_min-delta_a),dSmax);  
    delta_fut=delta_a+sign(delta_cost_min-delta_a).*ds;
    fprintf('4 : cost_cur=%.2f > %.0f && v=%.2f > %.2f\n',cost_cur,Ct,v,Vdes)
    
else
end

% pause