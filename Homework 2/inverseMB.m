% InverseMB.m | Mike Brice

% Function Parameters
%   a = nxn matrix

% Function Returns
%   a1 = inverse of "a"

function [a1] = inverseMB(a) 
  
% Gets the number of rows from matrix a, since a is a nxn matrix, the
% number of rows equals n.
n = size(a);

% Creates the identity matrix of size nxn
b = eye(n);

% Adds the identity matrix to the end of matrix a
ab = [a,b];

% Gets the number of rows and columns
[R, C] = size(ab);

% Iterate over all rows
for j = 1:R
    
    % Iterate over all rows starting at row j+1
    for k = j+1:R
        
        % If the value at index k,j is greater than the value at j,j then
        % swap row k with row j. Else do nothing.
        if ab(k,j) > ab(j,j)
            temp = ab(k,:);
            ab(k,:) = ab(j,:);
            ab(j,:) = temp;
        end
    end
    
    % Replace row j starting at column j to column C with the row starting at column j to column C divided
    % by the value at j,j
    ab(j,j:C) = ab(j,j:C)/ab(j,j);
    
    % Iterate over all rows starting at row j+1
    for i = j+1:R
        
        % Replace row i starting at column j to column C with row i
        % starting at column j to column C subtracted from the value at i,j
        % times row j starting at column j to column C
        % Performs row reduction
        ab(i,j:C) = ab(i,j:C) - ab(i,j) * ab(j,j:C);
    end
    
    % Iterate over rows starting at j-1 and decreasing until row 1
    for i = j-1:-1:1
        
        % Replace row i starting at column j to column C with row i
        % starting at column j to column C subtracted from the value at i,j
        % times row j starting at column j to column C
        % Performs row reduction
        ab(i,j:C) = ab(i,j:C) - ab(i,j) * ab(j,j:C);
    end
    
    % The inverse of matrix a is located at column n+1 to column C.
    a1 = ab(1:R,n+1:C);
end
end