function circularmotion=circularmotion(ro,vo)

G=6.67*10^-11;

ro=ro';

axis([-500 500 -500 500 -20 20]);
hold on;
plot3(0,0,0,'.','MarkerSize',85,'Color',[0 0 1]);
h=plot3(ro(1),ro(2),ro(3),'.','MarkerSize',15,'Color',[0 1 0],'EraseMode','xor');
grid on;

romag=sqrt(ro(1)^2+ro(2)^2+ro(3)^2); %magnitude of ro
vomag=sqrt(vo(1)^2+vo(2)^2+vo(3)^2); %magnitude of vo

w=vomag/romag; %omega

thetao=atan(ro(2)/ro(1));

dt=0.05;

for t=0:dt:80
    
    theta=thetao+(w*t);
    ROT=[cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0;0 0 1];
    
    r=ROT*ro;
    
    set(h,'Xdata',r(1),'YData',r(2),'ZData',r(3));
    drawnow;
    pause(0.01);
end;   