%Code for Problem 1
xLower = 5;
xUpper = 7;

%Run the first time
[outLower, outUpper] = GoldenRatio(xLower, xUpper);
%Throw out the leftmost
xLower = outLower;
fprintf("First Run: xLower is %.4f and xUpper is %.4f\n",... 
    outLower, outUpper);

%Run a second time
[outLower, outUpper] = GoldenRatio(xLower, xUpper);
%Throw out the rightmost
xUpper = outUpper;
fprintf("Second Run: xLower is %.4f and xUpper is %.4f\n",...
    outLower, outUpper);

%Run a third tim
[outLower, outUpper] = GoldenRatio(xLower, xUpper);
%Throw out the leftmost
xLower = outLower;
fprintf("Third Run: xLower is %.4f and xUpper is %.4f\n",...
    outLower, outUpper);


%Code for Problem 2
%Function operating on
func = @(x) x^10 - 10 * x^5 + 0.5 * exp(x) - .45;
%The derivative
derivFunc = @(x) 10 * x^9 - 50 * x^4 + 0.5 * exp(x);
%Set of intial guesses
intGuess = linspace(-3, 3, 600);

%Find roots of each guess
roots = zeros(1, 600);
for i = 1:600
    roots(i) = NewtonRaphson(intGuess(i), func, derivFunc, 1e-10, 400);
end