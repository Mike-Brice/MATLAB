% Problem 5.14 | Mike Brice

% Define Constants
%   kch = Spring constant between C-H bonds
%   kcc = Spring constant between C-C bonds
%   mh  = Mass of Hydrogen
%   mc  = Mass of Carbon
%   massConversion = AMU to KG conversion

kch = 5.92 * 10^2; % kg / s^2
kcc = 15.8 * 10^2; % kg / s^2
mh = 1.0; % amu
mc = 12.0; % amu
massConversion = 1.6605 * 10^-27; % 1 amu = 1.6605*10^-27 kg

% Converts the masses of the atoms into kg's.
mh = mh * massConversion; % kg
mc = mc * massConversion; % kg

% Matrix contains the matrix found in Problem 5.14
matrix = [(kch/mh), -(kch/mh), 0, 0;
          -(kch/mc), ((kch + kcc) / mc), -(kcc/mc), 0;
          0, -(kcc/mc), ((kch + kcc)/mc), -(kch/mc);
          0, 0, -(kch/mh), (kch/mh)];
     
% Finds the eigenvalues of the matrix
[eigenvectors eigenvalues] = eig(matrix);

% Eigenvalue = w^2 | sqrt(eigenvalue) = w
w = sqrt(diag(eigenvalues));

% Reminder that the values displayed are multiplied by the first number
disp('The eigenvalues w in hertz')
disp(w)

% The corresponding wavelengths
lambda = (2*pi*c) ./ w;r

% Reminder that the values displayed are multiplied by the first number
disp('The Corresponding Wavelengths in meters')
disp(lambda)

% Displays the eigenvectors
disp('The eigenvectors, each column is an eigenvector')
disp(eigenvectors)

%{
Defining the movement to the right to be positive and the movement to the
left to be negative.

For the first eigenvector and eigenvalue the atoms are moving in a rigid
body or moving together to the left. The first, second, third, and fourth
atoms are all moving in the same direction to the left at the same rate.

The second eigenvector and eigenvalue the atoms are moving towards the
center of the system, so the relative motion is that they are ocsellating
around the center of the system. The first spring is compressing and the
second spring is compressing and the third spring is compressing. The first
atom is moving toward the second atom and the second atom is moving toward
the third and the third is moving toward the second and the fourth is
moving toward the third.

The third eigenvector and eigenvalue the first spring is expanding and
the second spring is compressing and the third spring is expanding. The
first atom is moving away from the second atom and the second atom is
moving toward the third atom and the third atom is moving away from the
fourth atom.

The fouth eigenvector and eigenvalue the first spring is compressing and
the third spring is expanding and the second string is remaining the same
size due to the second and third atoms moving in the same direction at the
same rate The first atom is moving toward the second atom and the second
atom is moving toward the first atom and the third atom is moving toward
the second atom and the fourth atom is moving away from the third atom.
%}

