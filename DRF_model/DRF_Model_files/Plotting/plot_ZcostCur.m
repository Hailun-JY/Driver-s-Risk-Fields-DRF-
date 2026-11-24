    fig_h=figure(1);
    nn=3;
    if(ii==1)
    end
    
    % Risk
    subplot(nn,2,6)
    hold on
    plot(0.1.*Car_Nrp_Idx(ii),cost_cur,'ko','MarkerSize',2)
    line([0,15000],[Ct,Ct],'Color','k','LineWidth',0.75,'LineStyle',':')
    xlim([0.1.*Car_Nrp_Idx(ii)-500,0.1.*Car_Nrp_Idx(ii)+250])
    ylabel('Risk [-]');xlabel('Distance [m]')
    title(sprintf('%d',ii))

    % Lateral Deviation
    figure(1)
    subplot(nn,2,1)
    hold on
    plot(0.1.*Car_Nrp_Idx(ii),lat_dev,'ko','MarkerSize',2)
    line([0,15000],[0,0],'Color','k','LineWidth',0.75,'LineStyle',':')
    ylabel('Lat dev [m]');
    xlim([0.1.*Car_Nrp_Idx(ii)-500,0.1.*Car_Nrp_Idx(ii)+250])
    title(sprintf('nrp=%d',Car_Nrp_Idx(ii)))
    
    % Steering angle
    figure(1)   
    subplot(nn,2,3)
    hold on
    plot(0.1.*Car_Nrp_Idx(ii),(180./pi.*Sr).*delta_a,'ko','MarkerSize',2)
    line([0,15000],[0,0],'Color','k','LineWidth',0.75,'LineStyle',':')
    ylabel('SA [deg]');
    xlim([0.1.*Car_Nrp_Idx(ii)-500,0.1.*Car_Nrp_Idx(ii)+250])


    % Speed subplot
    figure(1)   
    subplot(nn,2,5)
    hold on
    plot(0.1.*Car_Nrp_Idx(ii),v,'ko','MarkerSize',2)
    line([0,15000],[Vdes,Vdes],'Color','k','LineWidth',0.75,'LineStyle',':')
    ylabel('Speed [m/s]');xlabel('Distance [m]')
    xlim([0.1.*Car_Nrp_Idx(ii)-500,0.1.*Car_Nrp_Idx(ii)+250])
    ylim([0,35])
    

    
     