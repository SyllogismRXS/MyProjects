%Create an image with a polygon and write it to disk.

clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global EMPTY    = 0;
global PREVPATH = 32;
global EXPL     = 50;
global OBSTACLE = 64;

InitState = [50,450]; %Init position is at x=450, y=50
                      %GoalState = [450,100];
                      %GoalState = [175,75];

%InitState = [50,50];
%GoalState = [150,50];
%GoalState = [450,300];
%GoalState = [450,325];
GoalState = [50,400];

global NumRows = 500;
global NumCols = 500;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = zeros(NumRows,NumCols);

%Create a polygon mask
x1    = [350 400 480 400 350 350];
y1    = [350 475 450 300 300 350];
poly1 = OBSTACLE*poly2mask(x1,y1,NumRows,NumCols);

x2    = [50 50  150 200 50];
y2    = [50 150 125 100 50];
poly2 = OBSTACLE*poly2mask(x2,y2,NumRows,NumCols);

x4    = [50  100 200 150 100 50 ];
y4    = [250 150 250 350 400 250];
poly4 = OBSTACLE*poly2mask(x4,y4,NumRows,NumCols);

x5    = [200 250 270 200 200];
y5    = [400 350 400 450 400];
poly5 = OBSTACLE*poly2mask(x5,y5,NumRows,NumCols);

x6    = [250 300 400 400 300 250];
y6    = [150 50  50  200 200 150];
poly6 = OBSTACLE*poly2mask(x6,y6,NumRows,NumCols);

x7    = [250 300 350 400 300 250];
y7    = [250 220 250 250 280 250];
poly7 = OBSTACLE*poly2mask(x7,y7,NumRows,NumCols);

A = A + poly1 + poly2 + poly4 + poly5 + poly6 + poly7;

pathTaken = [];
explored  = [];
success   = false;

%Call Path Finding Algorithm
%[pathTaken, explored, success] = dstar(A,InitState,GoalState);
[pathTaken, explored, success] = fmm(A,InitState,GoalState);
%[pathTaken, explored, success] = astar(A,InitState,GoalState);
%pathTaken = simplePath(A,InitState,GoalState);

success  % ?

[r,c] = size(explored);
for n = 1:r
    A( explored(n,2), explored(n,1) ) = EXPL;
end

[r,c] = size(pathTaken);
for n = 1:r
    A( pathTaken(n,2), pathTaken(n,1) ) = PREVPATH;
end

image(A);
%axis([50,60,50,60],"square");
set(gca,'YDir','normal');
