function [  Circuit_road_heading ] = Heading_circuit_road_solo( xvf,yvf,wh,Pipe_sequence,Is )
%GENERATE_CICUIT_ROAD_SOLO_HEADING Summary of this function goes here
%   Detailed explanation goes here

Circuit_road_heading=0.*xvf; % size of the input
% Adding all the pipes
for ii=1:length(Pipe_sequence)
%     if(ii==23); keyboard;end
    if(Pipe_sequence(ii)==1) % straight
         [ on_off ] = generate_straight_section( xvf,yvf,Is(ii,1),Is(ii,2),Is(ii,3),Is(ii,4),wh );
         [ road_head_temp ] = on_off.*Is(ii,3); % theta of the road
    elseif(Pipe_sequence(ii)==0) % curves
         [ on_off ] = generate_curved_section( xvf,yvf,Is(ii,6),Is(ii,7),Is(ii,8),Is(ii,9),wh, Is(ii,11) );
         [xc_temp,yc_temp] = generate_heading_curve_center( Is(ii,6),Is(ii,7),Is(ii,11),Is(ii,8) );
         [ theta_temp_center ] = rem( atan2((yvf-yc_temp),(xvf-xc_temp))+2.*pi ,2.*pi);
         [ road_head_temp ] =  on_off.*(theta_temp_center  - sign(Is(ii,8)-Is(ii,9)).*pi/2) ; 
         % sign(Is(ii,8)-Is(ii,9)) : this part makes sure that right turns
         % we add pi/2 and subtract pi/2 for left turns         
    else
        fprintf('Something went wrong in Circuit Pipe Generation\n')
        keyboard;
    end
        Circuit_road_heading= Circuit_road_heading+road_head_temp;  
end
end

