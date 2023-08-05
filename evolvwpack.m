function evolwpack=evolvwpack(A,w,k,n)

x=[-100:pi/20:100];

t=0;
z=pi/600;
dw=0;
dk=0;

y=0;

%y1=A*(sin((w*t)-(k*x)));

for count=1:1:n
    
    dy=A*(sin(((w+dw)*t)-((k+dk)*x)));
    
    y=y+dy;
    
    plot(x,y);
    pause(0.05);
    
    dw=dw+z;
    dk=dk+z;
end
end