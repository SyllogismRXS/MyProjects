N=10;

% Set up the networks (adjacency matrices)

% Complete Graph
AK=ones(N,N)-diag(ones(N,1));
LK=(N-1).*diag(ones(N,1))-AK;
eL=eig(LK); l2K=eL(2);

% Line Graph
AL=diag(ones(N-1,1),1)+diag(ones(N-1,1),-1);
LL=2.*diag(ones(N,1))-AL; LL(1,1)=1; LL(N,N)=1;
eL=eig(LL); l2L=eL(2);

% Cycle Graph
AC=AL; AC(1,N)=1; AC(N,1)=1;
LC=2.*diag(ones(N,1))-AC;
eL=eig(LC); l2C=eL(2);

% Generate the initial conditions randomly
d=2;  % How separated they are
X=2.*rand(2,N);
% initial centroid
Xbar0=zeros(2,1);
for i=1:N;
    Xbar0=Xbar0+X(:,i);
end;
Xbar0=1/N.*Xbar0;

%% Some numerical integration parameters
dt=0.01; % numerical steplength
Tf=25; % final time
eps=0.05; % termination condition

t=0; 
iter=1;

%setup the weights matrix
W = -0.2*ones(10,2)';

while (t<=Tf)

  %% A is the adjacency matrix associated with the system  
  %% Pick your favorite 
  A=AC;

  DX=zeros(2,N); %% Here is where we store the derivatives
  for i=1:N;
    for j=1:N;
      if (A(i,j)==1);

        %% 
        DX(:,i)=DX(:,i)+ (X(:,j)-X(:,i));   % The consensus equation
        % 
        if(A(i,j+1)==1)
        	DX(:,i)=DX(:,i)+ (X(:,j+1)-X(:,i));
        end;
        
        
      end; 
    end; 
  end;

%% Update the states using an Euler approximation
  for i=1:N;
    X(:,i)=X(:,i)+dt.*DX(:,i);
  end;

%% Update time
  t=t+dt;


%% Plot the solution every 5 iterations
  if (mod(iter,5)==0);
    show_graph(X,N,A,d);
  end;

  iter=iter+1;

  %% Check if we have terminated
  xmax=0;
  for i=1:N;
     xmax=max(xmax,norm(X(:,i)-Xbar0));
  end;

  if (xmax<eps);
      tconv=t,
      t=Tf+100;
  end;

end; %end the while