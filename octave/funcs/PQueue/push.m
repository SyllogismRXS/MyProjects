function [newList] = push(newNode, myList)
%End is lowest cost
%1 is highest cost
    myLen = qLen(myList);
    
    if myLen > 0
        highCostIndices = find(myList(:,3) >= newNode(3));
        lowCostIndices  = find(myList(:,3) <  newNode(3));
    
        newList = [myList(highCostIndices,:) ; newNode ; myList(lowCostIndices,:)];
    else
        newList = newNode;
    end
end
