function [root, numIterations] = NewtonRaphson(intGuess, func,...
    derivFunc, error, maxNumIterations)
%function [root, numIterations] = NewtonRaphson(intGuess, func,...
%    derivFunc, error, maxNumIterations)
%
%   Function implements the Newton-Raphson open root finding method
%       Inputs: intGuess, starting guess for the function
%               func, function using to find roots of 
%               derivFuc, derivative of the function
%               error, desired approximate relative error threshold
%               maxNumIterations, if reaches this then breaks from func
%       Outputs:root, root location
%               numIterations, numb of iterations it took to find the root

%Set intial values at the start
numIterations = 0;
root = intGuess;

%Loop until maxNumIterations reached
while(numIterations <= maxNumIterations)
    %Result of plugging in the root
    y = func(root);
    %Derivative at the point
    yPrime = derivFunc(root);
    %Calculate where root would be on a straight line
    x = root - (y / yPrime);
    
    %If it is close to same number calculate just before, assume root found
    if (abs((x - root) / x) < error)
        root = x;
        return
    end
    
    %Set as current root
    root = x;
    
    numIterations = numIterations + 1;
end
end