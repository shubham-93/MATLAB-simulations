function anim=projectile(u,theta,e)

theta=(theta)*(pi/180);
g=9.81;
s=0;
range=0;
h=plot(range,s,'.','MarkerSize',5,'EraseMode','none');

vver=u*sin(theta);
vhor=u*cos(theta);

peak=vver^2/(2*g);
peaktime=vver/g;
dt=0.01;
axis([0 14*e*vhor*2*peaktime 0 peak*1.1])

for n=0:1:100
          
    ht=(vver)*(e.^n);
    ttop=ht/g;
    top=(ht.^2)/(2*g);
    prev=range;
    if(top<=0.25)
        break;
        
    else    
        for t=0:dt:2*ttop
            
          s=(ht*t)-(g*t.^2)/2;
          range=prev+vhor*t;
          set(h,'XData',range,'YData',s);
          
          drawnow
          pause(0.01);
        end
    end   
end