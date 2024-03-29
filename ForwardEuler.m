function [func, iterate] = ForwardEuler(derivFunc, intX,...
    finalX, step, intFx)
% function [func, iterate] = ForwardEuler(derivFunc, intX,...
%   finalX, step, intFx)
%
%   This function applies forward Euler's method to an inputted derivative
%   function over a specified interval. It returns the caluculated points
%   and number of iterations. It then graphs the function.
%       Inputs: derivFunc, dervivative of function wishing to find
%               intX, x point which wanting to start the graph at
%               finalX, final point to graph
%               step, step size
%               intFx, intial y value of the function at the starting point
%       Outputs:func, the points found at each step
%               iterate, number of iterations (used to graph)

% Equivelent to y of i in our location. Result of last caluculation
yCurrent = intFx;
% Indicates where at on progression along steps of x-axis
xProgress = intX;
% Keeps track of number of loops
iterate = 1;
% Set up array func which is returned
func = zeros(1, (finalX - intX) / step);
% Add first, known point
func(1,1) = intFx;

% Loop until reach final point
while (xProgress < finalX)
    iterate = iterate + 1;
    % Formula for caluclating Euler
    func(1, iterate) = yCurrent + step * derivFunc(yCurrent);
    % Move one step further
    xProgress = xProgress + step;
    % Set result of function to yCurrent so updated for next loop
    yCurrent = func(1, iterate);
end

% Graph of the function based off of ForwardEuler
figure();
% Graph setup to show which x vlaues used and the function result
plot(linspace(intX, finalX, iterate), func);
title("Function as Found by Forward Euler");
xlabel("X-Value");
ylabel("Function Value");
end