% When you check for equality among floating points, some recent grads do
% this:
%
%       if (a == b) {
%           doWhatever(a, b);
%       }
%
% but that approach will get fooled by situations like this:
%      
%       if (2.0 = 1.99999999999999999) {
%           nothingHappens();
%       }
%
% That is why you should always have a function for checking that two 
% floats are close enough that they should be regarded as equal.
% 
% In the following function, I use 1E-6 as the default tolerance, but 
% you can you can use a different number if you like. In my experience,
% there is seldom a reason to use anything other than 1E-6 or 1E-9.
function y = approxEqual(a, b, tol)
    if nargin < 3
        tol = 1E-6;
    end
    
    y = abs(a - b) < tol;
end
