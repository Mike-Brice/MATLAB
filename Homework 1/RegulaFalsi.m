% RegulaFalsi.m | Mike Brice

% Function parameters
%   f = function
%   a = left bound
%   b = right bound

% Function returns
%   xn = approximate value when f(x) = 0
%   count = number of iterations the while loop performs

function [xn, count] = RegulaFalsi(f, a, b)

    tol = 0.00001; % While loop termination tolerance
    xn = 0.8; % Initial value to start the while loop
    count = 0; % Counter to count loop iterations

    % while f(xn) is greater than the tolerance
    while abs(f(xn)) > tol
    
        % Calculate xn
        xn = (a * f(b) - b * f(a)) / (f(b) - f(a));
        count = count + 1; % Increment the counter

        % if f(a)*f(xn) < 0 then f(x) = 0 is between a and xn
        if f(a) * f(xn) < 0
            b = xn;

        % if f(a)*f(xn) > 0 then f(x) = 0 is between xn and b
        elseif f(a) * f(xn) > 0
            a = xn;
        end
    end
end