function [ rootLoc, iterations ] = SecantMethod( func, x0, x1, maxIter, errTol,verbose )
% [ rootLoc, iterations ] = SecantMethod( func, x0, x1, maxIter, errTol,verbose )
% SECANTMETHOD Performs a secant-method root search on the function "func"
%   Inputs:                  
%       func: Function handle to the mathematical function to be evaluated;
%             only works for single-input mathematical functions
%       x0:   First initial guess (scalar)       
%       x1:   Second initial guess (scalar) - assumed to be better than x0
%       maxIter: The maximum number of iterations (default 100, may be
%           omitted or left empty)       
%       errTol: The "tolerance" at which we consider ourself done - will
%             run infinitely/until maxIter if errTol is negative (default
%             1e-6, may be omitted or left empty
%       verbose: a boolean input to say if you want lots of text on your
%               screen (default = 0)
%   Outputs:         
%       rootLoc: Our best guess for the x-val that is a root, scalar
%       iterations: number of iterations we ran
%                   

if(nargin < 4 || isempty(maxIter))
    maxIter = 100;
end
if(nargin < 5 || isempty(errTol))
    errTol = 1e-6;
end
if(nargin < 6)
    verbose = 0;
end
                
             
relativeChange = abs(errTol)*100; % Force it to run once
iterations = 0;             
while((relativeChange > errTol) && (iterations < maxIter))
    iterations = iterations + 1;
    y0 = func(x0);
    y1 = func(x1);
    x2 = x1 - y1 * (x1-x0) / (y1-y0);
                  
    if(verbose)
        format long
        disp([ iterations x2 (2*pi-x2)])
    end
                       
    x0 = x1;
    x1 = x2;
    relativeChange = abs((x1-x0)/x1);
end % x1 holds the root guess - we're either converged to within tolerance 
% or we've run enough times
              
rootLoc = x1;     

end       