function xdot = pend(x,t)
	k    = 1;
	m    = 5;
	w0_2 = 10;
	l    = 5;
	u    = 0;

	xdot(1,1) = x(2);
	xdot(2)   = -k/m*x(2) - w0_2*sin(x(1)) + 1/(m*l^2)*u;

