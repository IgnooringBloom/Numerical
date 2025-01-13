% Lagrange Interpolation
% October 10th, 2024
% MTH 361


clear all
close all
clc



x = [-1 0 1 2];            % The Interpolation nodes
xx = linspace(-1,2,100);         % All the points in space
fx = [0 -1 0 15];
n = length(x);                     % Number of points
l(1,:) = 1 + xx * 0;


%   Forming Lagrange Interpolants
for j = 1:n
    l(j,:) = 1 + xx * 0;        % ones(xx,1)
    for i = 1:n
        if i~=j
            l(j,:) = l(j,:).*(xx - x(i))/(x(j) - x(i));
        end
    end
     % plot(xx,l(j,:))
     % hold on
end

% Now we interpolate

P = 0 * xx;
for j = 1:n
    P = P + fx(j) * l(j,:);
end
plot(xx,P,'b')
hold on
% Q = spline(x,fx,xx);
% plot(xx,Q,'g')
% hold on
plot(x,fx,'rp')

hold on

fplot(@(x)(-(x+1).*(x-1).*(x-2))./2 + (5.*x.*(x+1).*(x-1))./(2),[-2,3],'r')
hold on
fplot(@(x)(2.*x.^3+x.^2-2.*x-1),[-2,3],'m');

% l(1,:) = (xx - x(2)).*(xx - x(3))/( (x(1) - x(2)).*(x(1) - x(3)) );     % x(1) = 0
% l(2,:) = (xx - x(1)).*(xx - x(3))/( (x(2) - x(1)).*(x(2) - x(3)) );     % x(2) = 0
% l(3,:) = (xx - x(1)).*(xx - x(2))/( (x(3) - x(1)).*(x(3) - x(2)) );     % x(3) = 0
