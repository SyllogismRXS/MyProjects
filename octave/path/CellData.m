classdef CellData
    properties
        x = 0;
        y = 0;
        ColorValue = EMPTY_COLOR;
        CellType   = EMPTY;
    end
    
    methods
        function obj = CellData(F)
            if nargin ~= 0 % Allow nargin == 0 syntax
                m = size(F,1);
                n = size(F,2);
                obj(m,n) = CellData; % Preallocate object array
                for i = 1:m
                    for j = 1:n
                        obj(i,j).Value = F(i,j);
                    end
                end
            end
        end        
        
        function obj = plus(obj1, obj2)
            if obj1.CellType != EMPTY
                obj.CellType = obj1.CellType;
                obj.x = obj1.x;
                obj.y = obj1.y;
                ColorValue = obj1.ColorValue;
            else %if obj2.CellType != EMPTY
                obj.CellType = obj2.CellType;
                obj.x = obj2.x;
                obj.y = obj2.y;
                ColorValue = obj2.ColorValue;
            end
        end
    end %end methods
    end %end classdef
        