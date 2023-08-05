function shm=shm(A,m,k)

w=sqrt(k/m);
t=0;

h=plot(0,0,'.','MarkerSize',35,'EraseMode','xor');
hold on;

axis([-A A -1 1]*1.5);
grid on;
dt=0.02;

for t=0:dt:100
    x=A*sin(w*t);
    X=[0 x];
    Y=[0 0];
    
    set(h,'XData',x,'YData',0); 
    
    drawnow;
    pause(0.01);
end