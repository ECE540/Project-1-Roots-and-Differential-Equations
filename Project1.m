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
funcPoint = zeros(1, 600);
for i = 1:600
    roots(i) = NewtonRaphson(intGuess(i), func, derivFunc, exp(-6), 100);
    funcPoint(i) = derivFunc(intGuess(i));
end

% Make a graph of which root found for each intial guess
% figure();
% plot(intGuess, roots);
% title("Roots Found Based on Different Intial Guesses");
% xlabel("Interval of Roots Tested from -3 to 3");
% ylabel("Found Root");

% Graph of the function
% figure();
% fplot(func, [-3 3]);
% ylim([-2 2]);
% grid on;
% title("Function x^1^0 - 10x^5 + 0.5e^x - .45");
% xlabel("X Value");
% ylabel("Y Result");

% Compare against Bisection
[bisectIterate, bisectRoot] = Bisection(func, .5, 1.5, exp(-10), 400);
[newtRoot, newtIterate] = NewtonRaphson(.5, func, derivFunc, exp(-10), 400);

% Problem 3
derivFunc = @(x) -8 * x;
startPoint = 0;
endPoint = 10;
% Will change
stepSize = 1/1000000;
tic
ForwardEuler(derivFunc, startPoint, endPoint, stepSize, 1);
toc
tic
BackwardEuler(derivFunc, startPoint, endPoint, stepSize, 1);
toc