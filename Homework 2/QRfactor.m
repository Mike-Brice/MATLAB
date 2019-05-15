% QRfactor.m | Mike Brice

% Function Parameters
%   R = a nxn matrix

% Function Returns
%  Q = Orthogonal Matrix 
%  R = Upper Triangular Matrix

function [Q, R] = QRfactor(R)

% Gets the number of rows and columns from the matrix R
nmatrix = size(R);

% Gets the number of rows and stores it in n
n = nmatrix(1);

% Generates the Identity matrix of size nxn
I = eye(n);

% Initializes Q to be the Identity matrix
Q = I;

% Iterate from 1 to n-1
for j = 1:n-1
    
    % Store column j of matrix R into c
    c = R(:,j);
    
    % Set the values of the column vector c to 0 except for index j
    c(1:j-1) = 0;
    
    % Set the values of column 1 in rows 1 to n to 0
    e(1:n,1) = 0;
    
    % If the value at index j of the column vector c is greater than 0, set
    % the value at index j of e to be 1, else -1
    if c(j) > 0
        e(j) = 1;
    else
        e(j) = -1;
    end
    
    % The lenght used to generate vector v is the square root of c and the
    % complex conjugate transpose of c
    clength = sqrt(c' * c);
    
    % The vector v is the vector c + the vector e times clength
    v = c + clength * e;
    
    % Constructs the Householder matrix
    H = I - 2 / (v' * v) * (v * v');
    
    % Q is the Householder matrix times the Identity matrix
    Q = Q * H;
    
    % R is the Householder matrix times the new R vector
    R = H * R;
end
end