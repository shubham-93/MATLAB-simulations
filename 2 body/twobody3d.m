function dw = twobody3d(t,w)

dw = zeros(12,1);

G = 30;
m1 = 10.^9;     %COORDINATES - (x1,y1,z1)
m2 = 10.^1;     %COORDINATES - (x2,y2,z2)

%w(2) = x1dot     %w(8) =  x2dot 
%w(4) = y1dot     %w(10) = y2dot 
%w(6) = z1dot     %w(12) = z2dot 

%w(1), w(2), ...... , w(12) are the variables to be input and

%Defining equations for the motion of BOTH bodies m1 and m2 - 

dw(1)= w(2);
dw(2)=((G*m2)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(7) - w(1));
dw(3)= w(4);
dw(4)=((G*m2)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(9) - w(3));
dw(5)= w(6);
dw(6)=((G*m2)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(11) - w(5));
dw(7)= w(8);
dw(8)=((G*m1)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(1) - w(7));
dw(9)= w(10);
dw(10)=((G*m1)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(3) - w(9));
dw(11)= w(12);
dw(12)=((G*m1)/(((w(7) - w(1)).^2 + (w(9) - w(3)).^2 + (w(11) - w(5)).^2).^(3/2)))*(w(5) - w(11));

%COORDINATES OF m1 (planet)
%w(1) =  x1
%w(3) =  y1
%w(5) =  z1

%COORDINATES OF m2(star)
%w(7) =  x2
%w(9) =  y2
%w(11) = z2
end