function dir = DirectionToGoal(Vec1, Vec2)
xDir = 0;
yDir = 0;

%Calculate direction to goal
xDir = Vec2(1) - Vec1(1);
yDir = Vec2(2) - Vec1(2);

%xUnit = 0;
%yUnit = 0;
%vecLength = sqrt( xDir^2 + yDir^2  );
%xUnit = xDir / vecLength;
%yUnit = yDir / vecLength;

degs = 180/pi*atan2(yDir,xDir);

if degs > 19.8 && degs < 70.2 
    %NE
    dir = [1,1];
elseif degs >= 70.2 && degs < 109.8
    %N
    dir = [0,1];
elseif degs >= 109.8 && degs < 160.2
    %NW
    dir = [-1,1];
elseif degs < -19.8 && degs > -70.2 
    %SE
    dir = [1,-1];
elseif degs <= -70.2 && degs > -109.8
    %S
    dir = [0,-1];
elseif degs <= -109.8 && degs > -160.2
    %SW
    dir = [-1,-1];
elseif (degs <= 19.8 && degs >= 0) || (degs >= -19.8 && degs <= 0)
    %E
    dir = [1,0];
else
    %W
    dir = [-1,0];
end
