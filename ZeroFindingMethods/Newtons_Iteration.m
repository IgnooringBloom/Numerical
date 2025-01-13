% MTH361 Fall 2024
% Newton Iteration
% Tej Sai Kakumanu

clear all
clc

m = 4;
a = sqrt(5/3);                                  % Left endpoint
b = 5;                                  % Right endpoint
f = @(y) (y^2-5)^m;
fp = @(y) m*((y^2-5)^m-1)*(2*y);


ResTol = 1.e-14;                        % Residual Tolerance
Nsteps = 100;
x = (b+a) / 2;
for i=1:Nsteps
    x = x - m*f(x)/fp(x);                 % Newton's Method
    xguess(i) = x;
    if(abs(f(x)) < ResTol)
        break
    end
end

xstar = x;
f(xstar);
