%script file for 2 bodies moving under gravity%

tspan = [0 20000];

[t,w] = ode45('twobody3d',tspan,[0,0  0,0  0,0    8000,-4500  3000,0  0,0]);

posmat = [t,w];  %matrix holding all values of positions of star and planet at all times calculated for
amount = size(posmat);   %amount is a matrix which has first value (1,1) = no. of time values where w positions are calculated ; no. of colums =13
tpoint = amount(1,1);   %this stores the number of time values used in a variable called 'tpoint'

start = 1;          %index to keep count of time
time = posmat(start,1);     %Initial starting time ,that is, 0 seconds

hm1 = plot3(w(start,1),w(start,3),w(start,5),'.','MarkerSize',7,'Color',[0.9 0 0],'EraseMode','none');
hold on;
hm2 = plot3(w(start,7),w(start,9),w(start,11),'.','MarkerSize',7,'Color',[0 0 1],'EraseMode','none');

start = start+1;

while start <= tpoint 

    x1 = w(start,1);   %m1's coordinates
    y1 = w(start,3);
    z1 = w(start,5);
    
    x2 = w(start,7);   %m2's coordinates
    y2 = w(start,9);
    z2 = w(start,11);
    
    set(hm1,'X',x1,'Y',y1,'Z',z1);
    set(hm2,'X',x2,'Y',y2,'Z',z2);
    
    drawnow;
    
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    pause(0.02);
    grid on;
    axis(1*[-10.^4 10.^4 -10.^4 10.^4 -10.^4 10.^4]);
    hold on;
    
    if start == tpoint      %break out of loop when the last time value is used up
        break;
    end
    
    start = start+1;
    %time = posmat(start,1);
end