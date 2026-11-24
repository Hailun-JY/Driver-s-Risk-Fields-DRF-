function [ lat_dev ] = lat_dev_calc( xv,yv,phiv,circuit_x_lc,circuit_y_lc,...
                wh,Pipe_sequence,Is )
%LAT_DEV Summary of this function goes here
%   Detailed explanation goes here

[ car_nrp_idx ] = car_nrp_idx_calc( xv,yv,phiv,circuit_x_lc,circuit_y_lc);

[  road_heading ] = Heading_circuit_road_solo( xv,yv,wh,Pipe_sequence,Is );
[ phi_point_temp] = atan2(yv-circuit_y_lc(car_nrp_idx), xv-circuit_x_lc(car_nrp_idx));
[ phi_point     ] = abs(rem(phi_point_temp+2*pi,2*pi));
[phi_dif_lat_dev] = phi_point - road_heading;
[phi_dif_lat_dev] = abs(rem(phi_dif_lat_dev+2*pi,2*pi));

if(pi/2 <= phi_dif_lat_dev &&  phi_dif_lat_dev <= 3*pi/2)
    %disp('behind')
    idx1=car_nrp_idx-1;
    idx2=car_nrp_idx;
else
    %disp('infront')
    idx1=car_nrp_idx;
    idx2=car_nrp_idx+1;
end

% using Heron's formula calculate lateral deviaiton
A_vrtx=[xv,yv]; % A vertex
B_vrtx=[circuit_x_lc(idx2),circuit_y_lc(idx2)];
C_vrtx=[circuit_x_lc(idx1),circuit_y_lc(idx1)];
AB_side=sqrt( (A_vrtx(1)-B_vrtx(1)).^2  +  (A_vrtx(2)-B_vrtx(2)).^2 );
BC_side=sqrt( (C_vrtx(1)-B_vrtx(1)).^2  +  (C_vrtx(2)-B_vrtx(2)).^2 );
AC_side=sqrt( (A_vrtx(1)-C_vrtx(1)).^2  +  (A_vrtx(2)-C_vrtx(2)).^2 );

s_peri = (AB_side + BC_side + AC_side)./2; % semi perimeter
herons_area=sqrt(s_peri.*(s_peri-AB_side).*(s_peri-AC_side).*(s_peri-BC_side));
lat_dev_mag=2.*herons_area./BC_side; % magintude of the lateral deviation

if(0 <= phi_dif_lat_dev &&  phi_dif_lat_dev <= pi )
    %disp('left')
    lat_dev_sign=1;
else
   %disp('right')
    lat_dev_sign=-1;
end


lat_dev = lat_dev_sign .* lat_dev_mag;

end

