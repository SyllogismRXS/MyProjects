function [newList] = qRemove(myIndex,myList)
    newList = [ myList(1:myIndex-1,:) ; myList(myIndex+1:end,:) ];
end
