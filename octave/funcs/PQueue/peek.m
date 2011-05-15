function [x] = peek(myList)
    myLen = qLen(myList);
    if myLen > 0
        x = myList(end,:);
    else
        x = [];
    end
end
