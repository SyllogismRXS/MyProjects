function [myDist] = Dcheb(pos1, pos2)
    myDist = max( abs(pos1(1)-pos2(1)) , abs(pos1(2)-pos2(2)) );
end
