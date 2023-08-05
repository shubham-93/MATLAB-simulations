%script file for 3 bodies moving under gravity

m1 = 10.^6;     
m2 = 10.^6;     
m3 = 10.^4;

tspan = [0 10.^5];

%xo1 = input('X of m1 = ');
%yo1 = input('Y of m1 = ');
%zo1 = input('Z of m1 = ');
%xd1 = input('XD of m1 = ');
%yd1 = input('YD of m1 = ');
%zd1 = input('ZD of m1 = ');

%xo2 = input('X of m2 = ');
%yo2 = input('Y of m2 = ');
%zo2 = input('Z of m2 = ');
%xd2 = input('XD of m2 = ');
%yd2 = input('YD of m2 = ');
%zd2 = input('ZD of m2 = ');

%xo3 = input('X of m3 = ');
%yo3 = input('Y of m3 = ');
%zo3 = input('Z of m3 = ');
%xd3 = input('XD of m3 = ');
%yd3 = input('YD of m3 = ');
%zd3 = input('ZD of m3 = ');

%matrix = [xo1 xd1 yo1 yd1 zo1 zd1 xo2 xd2 yo2 yd2 zo2 zd2 xo1 xd1 yo1 yd1 zo1 zd1 xo3 xd3 yo3 yd3 zo3 zd3 xo2 xd2 yo2 yd2 zo2 zd2 xo3 xd3 yo3 yd3 zo3 zd3];

matrix = [-9000 -30 0 100 0 0 , 9000 30 0 -100 0 0 , -9000 -30 0 100 0 0 , 2000 0 0 0 0 0 , 9000 30 0 -100 0 0 , 2000 0 0 0 0 0];

[t,w] = ode45('threebody3d',tspan,matrix);

posmat = [t,w];  %matrix holding all values of positions of all masses at all times calculated for
amount = size(posmat);   %amount is a matrix which has first value (1,1) = no. of time values where w positions are calculated ; no. of colums =13
tpoint = amount(1,1);   %this stores the number of time values used in a variable called 'tpoint'

start = 1;          %index to keep count of time
time = posmat(start,1);     %Initial starting time ,that is, 0 seconds

h1 = plot3(w(start,1),w(start,3),w(start,5),'.','MarkerSize',8,'Color',[0 0 0],'EraseMode','none');
hold on
h2 = plot3(w(start,7),w(start,9),w(start,11),'.','MarkerSize',8,'Color',[1 0 0],'EraseMode','none');
hold on;
h3 = plot3(w(start,19),w(start,21),w(start,23),'.','MarkerSize',8,'Color',[0 0 1],'EraseMode','none');

start = start+1;

while start <= tpoint 

    x11 = w(start,1);
    x12 = w(start,13);
    y11 = w(start,3);
    y12 = w(start,15);
    z11 = w(start,5);
    z12 = w(start,17);
   
    x21 = w(start,7);
    x22 = w(start,25); 
    y21 = w(start,9);
    y22 = w(start,27);
    z21 = w(start,11);
    z22 = w(start,29); 
    
    x31 = w(start,19);
    x32 = w(start,31);
    y31 = w(start,21); 
    y32 = w(start,33);
    z31 = w(start,23); 
    z32 = w(start,35);
    
    
    x1 = -((m2*x21)+(m3*x31))/m1;
    y1 = -((m2*y21)+(m3*y31))/m1;
    z1 = -((m2*z21)+(m3*z31))/m1;
    
    x2 = -((m1*x11)+(m3*x32))/m2;
    y2 = -((m1*y11)+(m3*y32))/m2;
    z2 = -((m1*z11)+(m3*z32))/m2;
    
    x3 = -((m1*x12)+(m2*x22))/m3;
    y3 = -((m1*y12)+(m2*y22))/m3;
    z3 = -((m1*z12)+(m2*z22))/m3;
    
    
   
    set(h1,'X',x1,'Y',y1,'Z',z1);
    set(h2,'X',x2,'Y',y2,'Z',z2);
    set(h3,'X',x3,'Y',y3,'Z',z3);
    
    drawnow;
    
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    pause(0.01);
    grid on;
    axis(1.8*[-10.^4 10.^4 -10.^4 10.^4 -10.^4 10.^4]);
    hold on;
    
    if start == tpoint      %break out of loop when the last time value is used up
        break;
    end
    
    start = start+1;
    %time = posmat(start,1);
end