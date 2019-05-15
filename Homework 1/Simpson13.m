% Simpson13.m | Mike Brice

% Function parameters
%   f = function
%   a = left bound
%   b = right bound

% Function returns
%   area = the approximate area under the curve
%   iterations = the number of iterations the while loop performs

function [area, iterations] = Simpson13(f, a, b)

    % Initialize the counter
    iterations = 0;
    
    % Initial number of subintervals
    n = 2;

    % Width of the subintervals
    h = (b-a)/n;

    % Summation of f(xi) for i = 2,4,6,...,n
    even = 0;
    % The first even xi, x2, is at a + h
    xi = a + h;
    for i = 2:2:n
        even = even + f(xi);
        % The value of xi is updated every iteration by xi + 2h because
        % every even x is 2h apart
        xi = xi+(2*h);
    end

    % Summation of f(xj) for j = 3,5,7,...,n-1
    odd = 0;
    % The first odd xj, x3, is at a + 2h
    xj = a + 2*h;
    for j = 3:2:n-1
        odd = odd + f(xj);
        % The value of xj is updated every iteration by xj + 2h because
        % every odd x is 2h apart
        xj = xj +(2*h);
    end

    % Inital approximate area under the curve
    area = (h/3.0) * (f(a) + f(b) + (4 * even) + (2 * odd));

    % Temporary difference to start the while loop
    difference = 1;

    % While the difference between the previous area and the current area
    % is greater than 0.001, repeat the loop
    while difference > 0.001

        % Temporary variable to store the previous area for comparision
        lastArea = area;

        % Double the number of subintervals
        % Bitshifting to the left by 1 is faster than multiplying by 2
        n = bitshift(n,1);

        % Width of the subintervals
        h = (b-a) / n;

        % Summation of f(xi) for i = 2,4,6,...,n
        even = 0;
        % The first even xi, x2, is at a + h
        xi = a + h;
        for i = 2:2:n
            even = even + f(xi);
            % The value of xi is updated every iteration by xi + 2h because
            % every even x is 2h apart
            xi = xi+(2*h);
        end

        % Summation of f(xj) for j = 3,5,7,...,n-1
        odd = 0;
        % The first odd xj, x3, is at a + 2h
        xj = a + 2*h;
        for j = 3:2:n-1
            odd = odd + f(xj);
            % The value of xj is updated every iteration by xj + 2h because
            % every odd x is 2h apart
            xj = xj +(2*h);
        end

        % Current approximate area under the curve
        area = (h/3.0) * (f(a) + f(b) + (4 * even) + (2 * odd));

        % Calculates the difference between the last area and the current
        % area
        difference = abs(lastArea - area);
        
        % Increment the counter
        iterations = iterations + 1;
    end
end