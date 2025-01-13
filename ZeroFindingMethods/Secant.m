% MTH361 Fall 2024
% Secant Method
% Tej Sai Kakumanu

clear all
clc


a = sqrt(5/3);                                  % Left endpoint
b = 5;                                  % Right endpoint
f = @(y) y^2;
fp = @(y) 2*y;


ResTol = 1.e-14;                        % Residual Tolerance
Nsteps = 100;
x_old = a;
x = (b+a) / 2;
for i=1:Nsteps
    xtemp = x;
    x = x - f(x)*(x-xold)/(f(x)-f(x_old));                 % Secant Iteration
    x_old = xtemp;
    xguess(i) = x;
    if(abs(f(x)) < ResTol)
        break
    end
end

xstar = x;
f(xstar);
