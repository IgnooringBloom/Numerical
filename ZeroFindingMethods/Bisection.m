% MTH361 Fall 2024
% bisection method
% Tej Sai Kakumanu

clear all
clc

f = @(x) x^2 - 3;                  % Define the Function

a = 1;                                  % Left endpoint
b = 2;                               % Right endpoint


ResTol = 1.e-10;                         % Residual Tolerance
ErrTol = 1.e-10;                         % Error Tolerance
Nsteps = ceil(log2((b - a)/ErrTol));    % Time Steps that will GUARENTEE we reach error tolerance.

if (f(a)*f(b) < 0)                      % Check that function has an opposite points at the left and right endpoints.
        tic
        for i=1:Nsteps                      % Take up to Nsteps
        x = (b+a)/2;                    % Find the midpoint
        xguess(i) = x;                  % Array that stores all the midpoints
        fxguess(i) = f(x);
        if (abs(f(x)) < ResTol)         % Check that my residual is not too small
            break;                      % Break if it is small enough
        end
        if(f(x) * f(a) < 0)             % Check which half has the value that we are looking for
            b = x;
        else
            a = x;
        end
    end
  end
    toc
xstar = x;
f(xstar)
