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
    iterate = iterate + 1;
    x = xProgress + step;
    slope = derivFunc(x);
    newFunc = @(y) slope*(-1 * step) - yCurrent + y;
    func(1, iterate) = SecantMethod(newFunc, xProgress, x);
    yCurrent = func(1, iterate);
    xProgress = x;
end

% Graph of the function based off of BackwardEuler
figure();
plot(intX:iterate-1, func);
title("Function as Found by Backward Euler");
xlabel("Points Used");
ylabel("Backward Euler Result");
end    