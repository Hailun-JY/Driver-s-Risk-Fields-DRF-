function [xvk1,yvk1,phivk1] = carkin(xvk,yvk,phivk,...
                                        vk,deltak,dt,L)
% CARKIN
% Car kinematics
% INPUTS:
% The car current 'state' is represented by posiitons (xvk, yvk) and 
% orientation (or heading) (phivk)
% steering angle (in radians) (deltak) and speed (vk)
% dt is the time step of the simulation
% L is the wheel base of the car 
% OUTPUTS:
% The future car state is represented by (xvk1,yvk1,phivk1)

xvk1    =   xvk     + dt.*vk.*cos(phivk);
yvk1    =   yvk     + dt.*vk.*sin(phivk);
phivk1  =   phivk   + dt.*(vk./L).*tan(deltak);

end

