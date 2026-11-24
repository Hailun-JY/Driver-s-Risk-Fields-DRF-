figure(1)
nn=2;
subplot(nn,2,2)
cla
hold on
plot_obstacles % its a script
plot(circuit_x_lc,circuit_y_lc,'k--')
plot(circuit_x_ib,circuit_y_ib,'k','Linewidth',2)
plot(circuit_x_ob,circuit_y_ob,'k','Linewidth',2)

plot(xv,yv,'o','MarkerSize',5,'MarkerFaceColor','b') % vehicle current
plot(Xv(1:ii),Yv(1:ii),'-','MarkerSize',1.5,'MarkerFaceColor','k')
quiver(xv,yv,v.*cos(phiv),v.*sin(phiv),'k') % vehicle current heading
plot(xvf,yvf,'o','MarkerSize',5) % vehicle future
quiver(xvf,yvf,v.*cos(phivf),v.*sin(phivf),'k')%vehicle future heading
quiver(xvf,yvf,v.*cos(phirf),v.*sin(phirf),'k')

title('Car_{cur} and Car_{t_{la}}')
xlabel('x')
ylabel('y')
xlim([min(xv,xvf)-10,max(xv,xvf)+10])
ylim([min(yv,yvf)-10,max(yv,yvf)+10])
axis('square')