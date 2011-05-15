function [path, explored, success] = astar(Map, InitState, GoalState)
% Computes the optimal path to the goal usin
% the A* algorithm
%
% Each node is organized as: 
% [y,x,CurrentCost,PathCostOnly,Parent y, Parent x]
%   
%
    global EMPTY;
    global PREVPATH;
    global OBSTACLE;
    global NumRows;
    
    tempDir = [[1,0];[1,1];[0,1];[-1,1];[-1,0];[-1,-1];[0,-1];[1,-1]];
    costs   = [1,1,1,1,1,1,1,1];
    %tempDir = [[1,0];[0,1];[-1,0];[0,-1]];
    %costs   = [1,1,1,1];
    
    
    [tempDirLen,c] = size(tempDir);    
    
    path = [];
    
    initNode = [InitState,Dcheb_3(InitState,InitState,GoalState),0,-1,-1];
    %initNode = [InitState,Dcheb_noDiag(InitState,InitState,GoalState),0,-1,-1];
    frontier = [initNode];
    explored = [];
    
    while true
        
        %If the frontier is empty, return failure
        if qLen(frontier) == 0
            path     = [];
            success = false;
            return;
        end
        
        [curNode,frontier] = pop(frontier); %choose the lowest cost node in
                                            %the queue
       
        explored = push(curNode,explored); %add the current node to
                                           %the explored queue
        
                
        %Have we reached the goal?
        if (curNode(1) == GoalState(1)) && (curNode(2) == GoalState(2)) 
            success = true;
            %str = sprintf('CurrentCost: %d\tPathCost: %d\n',curNode(3),curNode(4));
            %disp(str);
            
            traceNode = curNode;            
            
            %InitState
                                    
            parentIndex = 1;
            
            while parentIndex > 0
                path = [ traceNode  ; path ];
                
                parentIndex = exists([traceNode(5:6)],explored);
                
                if parentIndex > 0
                    traceNode = explored(parentIndex,:);
                end
            end
                
            return;
        end
                
                
        for i=1:tempDirLen
            %Create a new node based on possible actions
            %The cost to move to the next node is 1 square
            tempNode = [curNode(1) + tempDir(i,1), ...
                        curNode(2) + tempDir(i,2), ...
                        curNode(4) + costs(i),     ...
                        curNode(4) + costs(i),     ...
                        curNode(1)                 ...
                        curNode(2)];
                                 
            %is this correct?
            tempNode(3) = tempNode(3) + Dcheb_3(curNode,InitState,GoalState);
            %tempNode(3) = tempNode(3) + Dcheb_noDiag(curNode,InitState,GoalState);
            
            if isMapLocEmpty(Map,tempNode)
                frontIndex = exists(tempNode,frontier);
                
                if (exists(tempNode,explored) == 0) && (frontIndex == 0)
                    frontier = push(tempNode,frontier);
                elseif frontIndex > 0
                    if frontier(frontIndex,3) > tempNode(3)
                        frontier = qRemove(frontIndex,frontier);
                        frontier = push(tempNode,frontier);
                    end
                end 
            end %check for map location empty?
        end %check for loop through actions
    end %check while TRUE
end %function
    