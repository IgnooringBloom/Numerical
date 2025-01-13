% MTH361 Fall 2024
% Method of False position
% Tej Sai Kakumanu

clear all
clc

f = @(x) cos(x) - x;                  % Define the Function

a = 0;                                  % Left endpoint
b = pi;                               % Right endpoint


ResTol = 1.e-4;                         % Residual Tolerance
Nsteps = 100;    % Time Steps that will GUARENTEE we reach error tolerance.

if (f(a)*f(b) < 0)                      % Check that function has an opposite points at the left and right endpoints.
        tic
        x = (b+a)/2;                    % Find the midpoint
        xguess(1) = x
        if(f(x) * f(a) < 0)             % Check which half has the value that we are looking for
            xold = a;
        else
            xold = b;
        end
        for i=1:Nsteps                      % Take up to Nsteps
            xnew = (xold * f(x) - x*f(xold))/(f(x)-f(xold));
            if(f(xnew) * f(x) < 0)             % Check which half has the value that we are looking for
                xold = x;
            end
            x = xnew;

            if (abs(f(x)) < ResTol)         % Check that my residual is not too small
                break;                      % Break if it is small enough
            end
        
    end
  end
    toc
xstar = x;
f(xstar)
