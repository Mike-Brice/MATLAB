% Homework 1B | Mike Brice

% Problem 9.6
fprintf('Problem 9.6\n')

% f is the sine squared function in terms of x
f = @(x) sin(x)^2;

% The approximate area under the curve from x on the interval [0,pi] with
% 6 subintervals
[area, iterations] = Simpson13(f,0,pi);

fprintf('The approximate area under the curve is: %f with %d iterations\nThe real area is: %f\n\n', area, iterations, (pi/2.0))

% Problem 9.7
fprintf('Problem 9.7\n')

% f is a function in terms of x
f = @(x) (2 * x)/(1 + x^2);

% The approximate area under the curve from x on the interval [0,2.4] with 6
% subintervals
[area, iterations] = Simpson13(f,0,2.4);

fprintf('The approximate area under the curve is: %f with %d iterations\nThe real area is: %f\n', area, iterations, log(169.0/25.0))

%{
Problem 9.6: The approximation of the area under the curve is 1.570796 and
the real area under the curve is 1.570796. The two values are equal to 6
digit accuracy. The Simpson13 function performed 2 iterations before
reaching the best approximation.

Problem 9.7: The approximation of the area under the curve is 1.911059 and
the real area under the curve is 1.911023. The Simpson13 function performed
3 iterations before reaching the best approximation.

Simpson13 uses interpolation using three points to interpolate a polynomial
of degree two, which could be a quadratic. The three points used are a,b
and the midpoint. Each subinterval uses this to find the quadratic that is
used to approximate its area under the curve. 

The original issue was that the loop termination condition was based on the
difference being greater than 0.001 and my difference calculation did not
compensate for negative differences. By using an absolute value function I
was able to compensate for these negative differences and my termination
condition now terminates when the approximation is different by less than
0.001.
%}