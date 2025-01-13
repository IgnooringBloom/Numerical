% MTH361 Fall 2024
% Fixred Point Iteration method
% Tej Sai Kakumanu

clear all
clc

alpha = 1/3;                                     % What is alpha? and why is it there?qa
g = @(y) y - alpha * (y^2 - 2);                  % Define the Function
% gp = @(y) 1 - alpha * (2  * y);

a = 1;                                  % Left endpoint
b = 3;                                  % Right endpoint
%fa = sin(a)-1/2;                       % Function value at the left endpoint
%fb = sin(b)-1/2;                       % Function value at the right endpoint


ResTol = 1.e-4;                        % Residual Tolerance
Nsteps = 100;
x = (b+a) / 2;
for i=1:Nsteps
    x = g(x)            % How do we know its converging
    xguess(i) = x;
    if(abs(g(x) - x) < ResTol)
        break
    end
end

xstar = x
gp(xstar)
plot(gp(xguess))
