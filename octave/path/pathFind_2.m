%Create an image with a polygon and write it to disk.

clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global EMPTY    = 0;
global PREVPATH = 32;
global EXPL     = 50;
global OBSTACLE = 64;

%InitState = [90,40];
%GoalState = [5,40];

%InitState = [90,5];
%GoalState = [10,5];

%InitState = [90,70];
%GoalState = [10,70];

InitState = [95,80];
GoalState = [5,20];

global NumRows = 100;
global NumCols = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = zeros(NumRows,NumCols);

%Create a polygon mask
x1    = [10 40 40 10 10];
y1    = [10 10 40 40 10];
poly1 = OBSTACLE*poly2mask(x1,y1,NumRows,NumCols);

x2    = [50 60 70 90 50];
y2    = [50 30 20 50 50];
poly2 = OBSTACLE*poly2mask(x2,y2,NumRows,NumCols);

x4    = [10 30 50 20 10];
y4    = [80 95 80 60 80];
poly4 = OBSTACLE*poly2mask(x4,y4,NumRows,NumCols);

x5    = [20 45 45 20 20];
y5    = [55 55 45 45 55];
poly5 = OBSTACLE*poly2mask(x5,y5,NumRows,NumCols);

x6    = [60 70 90 80 60];
y6    = [60 90 90 60 60];
poly6 = OBSTACLE*poly2mask(x6,y6,NumRows,NumCols);

x7    = [250 300 350 400 300 250];
y7    = [250 220 250 250 280 250];
poly7 = OBSTACLE*poly2mask(x7,y7,NumRows,NumCols);

A = A + poly1 + poly2 + poly4 + poly5 + poly6;% + poly7;

pathTaken = [];
explored  = [];
success   = false;

%Call Path Finding Algorithm
%[pathTaken, explored, success] = dstar(A,InitState,GoalState);
[pathTaken, explored, success] = fmm(A,InitState,GoalState);
%[pathTaken, explored, success] = astar(A,InitState,GoalState);
%pathTaken = simplePath(A,InitState,GoalState);

[r,c] = size(explored);
for n = 1:r
    A( explored(n,2), explored(n,1) ) = EXPL;
end

pathCurve = [];

[r,c] = size(pathTaken);
for n = 1:r
    A( pathTaken(n,2), pathTaken(n,1) ) = PREVPATH;
    pathCurve = [pathCurve , pathTaken(n,2)];
end

smoothValue = smoothness(pathCurve)

figure;
image(A);
xlabel('X Position');
ylabel('Y Position');
%axis([50,60,50,60],"square");
set(gca,'YDir','normal');
