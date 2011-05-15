t = linspace (0.0, 50, 2000);
x0 = [pi-0.01 ; 0.0];
xa = lsode("pend", x0, t);

plot(t,xa(:,1));
title('x(1)');
figure;
plot(t,xa(:,2));
title('x(2)')

