function [func] = ForwardEuler(derivFunc, intX, finalX, step, intFx)
% function [func] = ForwardEuler(derivFunc, intX, finalX, step, intFx)

% Equivelent to y of i in our location. Result of last caluculation
yCurrent = intFx;
% Indicates where at on progression along steps of x-axis
xProgress = intX;
% Keeps track of number of loops
iterate = 0;
% Set up array func which is returned
func = zeros(1, (finalX - intX) / step);

% Loop until reach final point
while (xProgress < finalX) 
    % Formula for caluclating Euler
    func(1, iterate) = yCurrent + step * derivFunc(yCurrent);
    % Move one step further
    xProgress = xProgress + step;
    % Set result of function to yCurrent so updated for next loop
    yCurrent = func;
    iterate = iterate + 1;
end
end