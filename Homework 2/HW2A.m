% HW2A | Mike Brice

% Coefficient Matrix
a = [3 -5 7 -9; -2 4 -6 8; 8 0 -3 0; 0 1 0 14];

% Result Matrix
b = [11; -10; 17; 6];

% Performs the GaussJordan method and returns the Reduced Coefficient Matrix
% and the Reduced Result Matrix
[a1, x] = GaussJordan(a,b);

% Validate that GaussJordan produces correct results
fprintf('Validating that GaussJordan produces correct results\n')
disp(a*x)
disp(b)
disp('Correct Results')
% GaussJordan produdces correct results

% Calculates the inverse of the matrix a
disp('Inverse of Matrix a')
[aa] = inverseMB(a);
disp(aa)

% Validate that the inverseMB produces correct results using a*a^-1 = I 
fprintf('Validating inverseMB\n')
disp(a*aa)
% inverseMB produces the correct result 
disp('Correct result')

% Matrices whose determinent are 0 causes GaussJordan to fail
% Here is an example of a matrix where GaussJordan and inverseMB fails
fprintf('Demonstrating when GaussJordan and inverseMB fails\n')
d = [1 2; 2 4];
disp('A matrix that causes GaussJordan to fail')
disp(d)
e = [1; 2];
[d1, y] = GaussJordan(d,e);

disp('Reduced Coefficient Matrix')
disp(d1)
disp('Reduced Result Matrix')
disp(y)
[dd] = inverseMB(d);
disp('Inverse of matrix')
disp(dd)

% Matrices whose determinent are 0 causes GaussJordan to fail. These
% matrices are also non invertiable. A matrix whose rows are a linear
% combination of other rows will cause it to fail.
