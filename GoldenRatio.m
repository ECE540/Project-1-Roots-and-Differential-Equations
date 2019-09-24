function [outLower,outUpper] = GoldenRatio(inLower,inUpper)
%function [outLower,outUpper] = GoldenRatio(inLower,inUpper)
%   Golden Ratio is a function which returns the two inner values which 
%   are needed for Golden ration given two intial lower and upper
%   bounds
%       Inputs: inLower, the lower bound for "x"
%               inUpper, the upper bound for "x"
%       Outputs:outLower, the lower GR value 
%               outUpper, the upper GR value

%Follow the formula used in class
dist = (inUpper - inLower) / 1.618;

outLower = inUpper - dist;
outUpper = inLower + dist;
end