function [ p_x1,p_x2,p_x3,p_x4,p_y1,p_y2,p_y3,p_y4 ] = obstacle_straight_patch( Os,kk,dt,ii,jj)
%OBSTACLE_STRAIGHT_PATCH Summary of this function goes here
%   Detailed explanation goes here
        global Trigger_obs
        ii_str=find(Trigger_obs(jj,:)==1,1);
        if(isempty(ii_str))
            ii_str=1e20;
        end
        rect_v=Os(kk,7);
        rect_start=Os(kk,8);
        rect_theta=Os(kk,3);
        rect_x1=Os(kk,1); rect_y1=Os(kk,2);
        % ---- Accounting for speed ----- %
        rect_x1=rect_x1+rect_v.*dt.*(ii-ii_str).*cos(rect_theta);
        rect_y1=rect_y1+rect_v.*dt.*(ii-ii_str).*sin(rect_theta);
        
        rect_l=Os(kk,4);
        rect_w=Os(kk,5);
        p_x1=rect_x1+0.5.*rect_w.*cos(rect_theta+pi/2);
        p_y1=rect_y1+0.5.*rect_w.*sin(rect_theta+pi/2);
        p_x2=p_x1+rect_l.*cos(rect_theta);
        p_y2=p_y1+rect_l.*sin(rect_theta);
        p_x4=rect_x1+0.5.*rect_w.*cos(rect_theta-pi/2);
        p_y4=rect_y1+0.5.*rect_w.*sin(rect_theta-pi/2);
        p_x3=p_x4+rect_l.*cos(rect_theta);
        p_y3=p_y4+rect_l.*sin(rect_theta);

end

