%fir
%ss
%tf
%zp

%sys2fir
%sys2tf
%sys2zp

%num   = [5, -1];
%denom = [1, -2, 6];

%sys = tf(num,denom);


nump = 1;
denp = [1,1];

P = tf(nump,denp,0,"plant input", "plant output");

numk = [1,1];
denk = [1,0];

K = tf(numk, denk, 0, "controller input", "controller output");

PK = sysgroup(P,K);

PK = sysdup(PK,[],2);

PK = sysscale(PK,[],diag([1, 1, -1]));

out_connect = [1,2];
in_connect  = [3,1];

PK0 = sysconnect(PK,out_connect,in_connect);

PK0 = sysprune(PK0,1,2);

[num,den] = sys2tf(PK0);

comp = tf(num,den);

step(comp);

