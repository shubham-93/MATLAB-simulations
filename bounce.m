function anim=bounce(u,e)
g=9.81;
s=0;
h=plot(0.5,s,'.','MarkerSize',20,'EraseMode','xor');

dt=0.04;
axis([0 1 0 100])

for n=0:1:100
        
    u=(u)*(e.^n);
    ttop=u/g;
    top=(u.^2)/(2*g);
    if(top<=0.25)
        break;
        
    else    
        for t=0:dt:2*ttop
    
          s=(u*t)-(g*t.^2)/2;
          set(h,'XData',0.5,'YData',s);
          drawnow
          pause(0.01);
        end
    end   
end