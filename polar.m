function pol=pol

for i=1:10
    for t=0:pi/150:2*pi
       theta=((cos(i*t)).^2).*((sin((i*i*i)*t)).^2);
      polar2(t,theta,[0 1],'--.');
      hold on;
      pause(0.01);
    end
end
end