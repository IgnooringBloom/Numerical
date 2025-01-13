%Newton Divided Differences 
clear all
close all

x = [0 4 8 12 16];
fx = [0.92 1.24 1.47 1.29 1.11];
n = length(x);  % Number of points
xx = linspace(0, 16, 100);  % Range of points for interpolation

% Zero-th divided differences (initialization)
dd = zeros(n, n);  % Create an n x n matrix for divided differences

for j = 1:n
    dd(1, j) = fx(j);  % First row (0th divided difference) is just fx values
end

% All divided differences
for i = 2:n  % Loop over levels of divided differences
    for j = 1:n-i+1  % Loop for the jth value of the ith divided difference
        dd(i, j) = (dd(i-1, j+1) - dd(i-1, j)) / (x(j+i-1) - x(j)); 
    end
end


% Prepare the product terms for the Newton Polynomial
prod = ones(n, length(xx));  % Matrix to hold the product terms

for i = 2:n
    for j = 1:length(xx)
        prod(i, j) = prod(i-1, j) .* (xx(j) - x(i-1));  % Product of terms (x - xi)
    end
end

% Calculate the Newton Interpolation Polynomial
P = dd(1, 1) + 0 * xx;  % Start with the 0th term (f(x0))
for i = 2:n
    P = P + dd(i, 1) .* prod(i, :);  % Add higher-order terms
end

% Plot the result
xlim([0 16]);
ylim([0 2]);
plot(xx, P, 'b', 'DisplayName', 'Newton Divided Differences');
hold on;
Q = spline(x, fx, xx);  % Cubic spline interpolation
plot(xx, Q, 'g', 'DisplayName', 'Spline Interpolation'); 
plot(x, fx, 'rp', 'MarkerFaceColor', 'r', 'DisplayName', 'Data Points');
legend('show');