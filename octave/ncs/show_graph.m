function[]=show_graph(X,N,A,d);

figure(1);
hold off;

for i=1:N;
  plot(X(1,i),X(2,i),'o');
  hold on;
  for j=1:N;
    if (A(i,j)==1);
      plot([X(1,i),X(1,j)],[X(2,i),X(2,j)]);
end; end; end;

axis([0,d,0,d]);
drawnow;


