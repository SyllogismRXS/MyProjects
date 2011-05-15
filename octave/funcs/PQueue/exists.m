function [myIndex] = exists(node,myList)
    
    if (node(1) < 0) || (node(2) < 0)
        myIndex = 0;
    end
    
    result = find(myList(:,1) == node(1) & myList(:,2) == node(2) );
    
    [r,c] = size(result);
    
    if r == 0
        myIndex = 0;
    else
        myIndex = result(1);
    end
end
