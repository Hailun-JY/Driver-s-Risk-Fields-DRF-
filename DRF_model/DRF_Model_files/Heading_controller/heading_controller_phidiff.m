function [phidiff]=heading_controller_phidiff(phirf,phivf)


% Finds the 2 'complementary angles' (sum=360deg)
adiff=abs(phirf-phivf);
bdiff=abs(2*pi-adiff);


abs_phidiff=min(adiff,bdiff);

if(abs_phidiff==bdiff)
    sign_phidiff=-1.*sign(phirf-phivf);
else
    sign_phidiff= 1.*sign(phirf-phivf);
end

phidiff=sign_phidiff.*abs_phidiff;
% keyboard;

end

