% Homework 1A | Mike Brice

% Define Variables
%    massFloat = the mass of the float
%    diameterFlat = the diameter of the float
%    rho = the density of sea water
%    vSubmerged = the volume that is submerged
%    dSubmerged = the depth the float is submerged
%    solution = the depth the approximate depth the float is submerged

% Density of Sea Water
rho = 1030.0; % kg/m^3

% Prompt the user to enter the mass of the float in kg
massFloat = input('What is the mass of the float in kg? ');

% Prompt the user to enter the diameter of the float in cm
diameterFloat = input('What is the diameter of the float in cm? ') / 100.0; % Divide by 100 to make it in meters

% Calculates the density of the float to make sure the float doesn't sink
rhoFloat = massFloat / ((4.0/3.0) * pi * (diameterFloat/2.0)^3); % kg/m^3

% If the density of the float is greater than the density of sea water,
% then the float will sink

% Asks the user to re enter a mass and diameter and loop if the new density
% of the float is still greater than the density of sea water

% Exit loop if the density of the float is less than the density of sea
% water
while rhoFloat > rho
    fprintf('\nThe mass and diameter you entered will not float\n\n')
    
    % Prompt the user to re enter the mass of the float in kg
    massFloat = input('What is the mass of the float in kg? ');
    
    % Prompt the user to re enter the diameter of the float in cm
    diameterFloat = input('What is the diameter of the float in cm? ') / 100.0; % Divide by 100 to make it in meters
    
    % Calculates the new density of the float to check if the float will sink
    rhoFloat = massFloat / ((4.0/3.0) * pi * (diameterFloat/2.0)^3); %kg/m^3
    
end

% vSubmerged in terms of dSubmerged related to mass of displaced water,
% written in the form f(x) = 0
vSubmerged = @(dSubmerged) (1.0/3.0) * pi * dSubmerged^2 * (1.5 * diameterFloat - dSubmerged) - massFloat / rho;

% Calls the RegulaFalsi function to approximate when f(x) = 0
% Returns the approximate value of x and the number of iterations
[solution, iterations] = RegulaFalsi(vSubmerged, 0.0, diameterFloat);

fprintf('\nRegulaFalsi function')

% h is the portion of the float that is above water.
h = 100 * (diameterFloat - solution);
fprintf('\nThe height above the water is %f\n', h)

% The number of iterations the RegulaFalsi function took to approximate the
% solution
fprintf('The number of iterations taken by RegulaFalsi is %d\n', iterations)

fprintf('\nBuilt in fzero function')

% Initial Interval
x = [0.0, diameterFloat];

% Runs the built in fzero function, fzero(function, initial_interval)
solution = fzero(vSubmerged, x);

% h is the portion of the float that is above water.
h = 100 * (diameterFloat - solution);
fprintf('\nThe height above the water is %f\n', h)

%{
The fzero functions uses a combination of bisection, secant, and inverse
quadratic interpolation methods
(https://www.mathworks.com/help/matlab/ref/fzero.html#btoc6lj-17).
When fzero is using a single value instead of an interval, the outcome depends
on the initial point. When the initial point is at 0, the results are 
significantly large compared to the interval results. When the initial  
point is around 0.5 the results seem to be similar to the interval results. 
When the initial point is 1 or greater the results are negative.

The fzero function can also be used with an option parameter to modify the
solution process. 

The fzero function produces similar numbers to the RegulaFalsi function
which is implemented here.

The RegulaFalsi function produces a height above water as 65.798246 and the
fzero function prodcues a height above water as 65.795070 when the mass of
the float is 70 kg and the diameter as 90 cm and took 4 iterations. The
larger the mass and diameter the more iterations RegulaFalsi takes.

The original problem was the loop termination condition in the RegulaFalsi
function. The termination condition did not compensate for when the current
approximated value of f(xn) was negative. By using an absolute value
function, the termination condition compensates for these negative values
and terminates the loop when f(xn) is smaller than 0.00001.
%}

