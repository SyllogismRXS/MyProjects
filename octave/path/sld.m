function [myDist] = sld(pos1, pos2)
    myDist = sqrt( (pos1(2) - pos2(2))^2 + (pos1(1) - pos2(1))^2 );
end
