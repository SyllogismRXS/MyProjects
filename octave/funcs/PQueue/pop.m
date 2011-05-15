function [x,myList] = pop(myList)
    myLen = qLen(myList);
    if myLen > 0
        x = myList(end,:);
        myList = myList(1:end-1,:);
    else
        myList = [];
        x = [];
    end
end
