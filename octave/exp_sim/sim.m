t=linspace(0,5,50);
x0 = 2;
x=lsode("myexp",x0,t);

plot(t,x);
