function [ iterations, xVal, yVal ] = ...
                Bisection( func, lowerBound, upperBound, stopCriteria, ...
                           maxIter)
%function [ iterations, xVal ] = Bisection( func, lowerBound, upperBound, 
%                                           stopCriteria, maxIterations )
%   Bisection is a function that applies the "bisection" iterative
%   root-finding technique for f(x) = 0.  It continues until either of the 
%   stopping critieria are met.
%       Inputs: func, a handle to the function to be evaluated
%               lowerBound, the lower bound for "x"
%               upperBound, the upper bound for "x"
%               stopCriteria, the relative approximate error that is
%                             considered sufficient for the problem, NOT in
%                             percentages (e.g. 1% should be entered as
%                             0.01)
%               maxIterations, the number of iterations to proceed (note of
%                              course that in bisection, this is redundant
%                              with stopCriteria, whereas in other methods
%                              it might be quite important).
%       Outputs:  iterations, the number of iterations performed
%                 xVal, the final "x" value approximating the root
%                 yVal, the value of f(x) at xVal
%       Contractions: "val" for value, "iter" for iteration, "func" for
%                     function, x_ and y_ for "value of x and y
%                     corresponding to the lower bound (l), upper bound (u)
%                     and midpoint (m)
%  Section: Input cleaning: Begin sanity-checking inputs, throw errors
%  This statement checks for insufficient inputs
if(nargin < 4 ...
   || (nargin == 4 && isempty(stopCriteria) ) ) % No stopping criteria given
    error('You must specify at least one stopping criteria to avoid an infinite loop');
%  This statement checks for missing maxIter
elseif(nargin == 4 ...
   || isempty(maxIter)) %From above, implictly stopCriteria is not empty
    maxIter = inf;
%  This statement checks for missing stopCriteria
elseif(isempty(stopCriteria)) %Stop criteria empty, MaxIter is not
    stopCriteria = eps;
end
%  Section: variable initialization
iter = 0;
approximateError = inf;
yL = func(lowerBound);
yU = func(upperBound);
%  Section:  Actual bisection method, loops while stopping criteria not yet
%  met
while(iter < maxIter ...
      && approximateError > stopCriteria)
  % Calculate new value for xM, yM
  xM = (lowerBound + upperBound) / 2;
  yM = func(xM); % Search which section has a sign change
  if(yU*yM < 0)
      yL = yM;
      lowerBound = xM;
  elseif(yL*yM < 0)
      yU = yM;
      upperBound = xM;
  end
  newXM = (lowerBound + upperBound) / 2;
  approximateError = abs( (xM-newXM) / max(abs(newXM),abs(xM)) ); 
  iter = iter + 1;
end %  Main while loop - conditions met for convergence
%  Output variables
xVal = newXM;
yVal = func(xVal);
iterations = iter;
end