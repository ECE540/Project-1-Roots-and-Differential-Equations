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

%Set to zero at the start
numIterations = 0;
root = intGuess;

%Loop until maxNumIterations reached
while(numIterations <= maxNumIterations)
    y = func(root);
    yPrime = derivFunc(root);
    x = root - (y / yPrime);
    
    if (((x - root) / x) < error)
        root = x;
        return
    end
    
    root = x;
end
end
