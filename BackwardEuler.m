function [func, iterate] = BackwardEuler(derivFunc, intX,...
    finalX, step, intFx)

% Equivelent to y of i in our location. Result of last caluculation
yCurrent = intFx;
% Indicates where at on progression along steps of x-axis
xProgress = intX;
% Keeps track of number of loops
iterate = 1;
% Set up array func which is returned
func = zeros(1, (finalX - intX) / step);
% Add first know point
func(1,1) = intFx;

while(xProgress < finalX)
    % Keep track of where at in function matrix
    iterate = iterate + 1;
    % Keep track of which point finding function value at
    x = xProgress + step;
    % Uses the formula which says function value at point before is equal
    % to function value at current point minus step size times derivitate
    % of function a function value
    newFunc = @(y) y - step * derivFunc(y) - yCurrent;
    % Use the secant method to find where the point is. Pass in funtion
    % just made with old x value and where think x should be
    func(1, iterate) = SecantMethod(newFunc, xProgress, x);
    % Keep values updated
    yCurrent = func(1, iterate);
    xProgress = x;
end

% Graph of the function based off of BackwardEuler
figure();
% Use linspace because want to show range of x values as well as keeping
% correct points required to graph
plot(linspace(intX, finalX, iterate), func);
title("Function as Found by Backward Euler");
xlabel("X-Value");
ylabel("Function Value");
end    