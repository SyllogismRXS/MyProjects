function [myBool] = isMapLocEmpty(Map,loc)
%Check Boundaries for out of range locations
%Return true if the location is empty
    global EMPTY;
    
    [r,c] = size(Map);
    
    if loc(1) < 1 || loc(2) < 1
        myBool = false;
        return;
    end
    
    if loc(1) > c || loc(2) > r
        myBool = false;
        return;
    end
    
    myBool = Map(loc(2),loc(1)) == EMPTY;
    
    %str = sprintf('x: %d\ty:%d\tMap value:%d\n',loc(2),loc(1),Map(loc(2:-1:1)));
    %disp(str);
    
    %if myBool == false
    %    disp('False here');
    %end
    
end

