% GaussJordan.m | Mike Brice

% Function Parameters
%   a = Coefficient Matrix
%   b = Result Matrix

% Function Returns
%   a1 = Reduced Coefficient Matrix
%   x = Reduced Result Matrix 

function [ a1,x ] = GaussJordan( a,b )

% Combines the matrix a and b
ab = [a,b];

% Gets the number of rows and number of columns
[R,C] = size(ab);

% Iterate over all rows
for j=1:R
    
    % Iterate over all rows starting at j+1
    for k=j+1:R
        
        % If the value at index k,j is greater than the value at j,j then
        % swap row k with row j. Else do nothing.
        if ab(k,j)>ab(j,j)
            temp = ab(k,:);
            ab(k,:) = ab(j,:);
            ab(j,:) = temp;
        end
    end
    
    % Replace row j starting at column j to column C with the row starting
    % at column j to column C divided by the value at j,j
    ab(j,j:C) = ab(j,j:C)/ab(j,j);
 
    % Iterate over all rows starting at row j+1
    for i = j+1:R
        
        % Replace row i starting at column j to column C with row i
        % starting at column j to column C subtracted from the value at i,j
        % time row j starting at column j to column C
        % Performs row reduction
        ab(i,j:C) = ab(i,j:C)-ab(i,j)*ab(j,j:C);
    end
    
    % Iterare over rows starting at j-1 and decreasing until row 1
    for i = j-1:-1:1
        
        % Replace row i starting at column j to column C with row i
        % starting at column j to column C subtracted from the value at i,j
        % times row k starting at column j to column C
        % Performs row reduction
        ab(i,j:C) = ab(i,j:C)-ab(i,j)*ab(j,j:C);
    end
    
% The Result matrix is found at column C
x = ab(1:R,C);

% The reduced Coefficient matrix is found at column 1 to column C-1
a1= ab(1:R,1:C-1);
end

end