function wpacket=wpacket(A,w,k,c)

x=[-100:pi/50:100];

dw=c*(pi/30);
dk=pi/30;

for t=0:pi/20:40
    y1=A*(sin((w*t)-(k*x)));

    y2=A*(sin(((w+dw)*t)-((k+dk)*x)));

    y=y1+y2;

    plot(x,y);
    pause(0.05);
    xlabel('x');
    ylabel('y=y1+y2');
    
end

end