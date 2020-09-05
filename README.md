# Safe2Divide
% Early career engineers often neglect to check for division by 0, or do so in an overly simplistic manner. 
% This library illustrates the algorithms you need to avoid those pitfalls.
%
% Author: Jim Strieter
% Date: 09-05-2020
%
% One valuable thing that I learned from MATLAB is its "near singularity
% warning". When you invert a matrix in MATLAB and its determinant is 
% below some threshold, MATLAB tells you something like, 
% "This matrix is technically invertible, but with a determinant of only 
% 1E-37, you really should think twice before using the result."
%
% That warning (which, if you ever get it, you should probably regard that 
% matrix as not invertible for all practical purposes) got me thinking 
% about tiny denominators. This is one domain in which one size definitely
% does not fit all. For instance, if your numerator is 1E-20, a denominator
% of 1E-24 is not especially small. The salient point is, "How close
% to the limit of IEEE floating point will the result be?" If the result
% leaves less than 3 spare exponent bits or 
% 
% If you prefer to think in decimal terms, a good rule of thumb is this:
%
%       For 64 bit floating point, try to keep things between 
%
% For most applications that I've worked on, 1E-9 is small enough, although
% the rule of thumb I suggest above allows for smallestAllowableDenominator
% to be quite a bit smaller, provided your numerator isn't going too far
% over 1E100. From a purely mathematical standpoint, you can have a
% numerator = 1E100 and denominator = 1E-100 and get a reasonably 
% accurate answer. I prefer to stay even farther away from those extremes
% however, for these reasons:
%
%       1.) Every implementation of IEEE floating point has its quirks.
%           Every. Single. One. The quirks are different from one CPU
%           to another, and one C++ compiler to another. "But the 
%           compiler is certified!" I don't care. Congratulations!
%           You're an astronaut now! Do you want to ride on
%           a spacecraft in which the DSP engineer was starry eyed 
%           about compiler compliance? Me neither. 
%
%       2.) Read #1 again. 
%
%       3.) Single event upsets. Cosmic rays. Power supply fluctuation. 
%           Orphaned neutrons chipping away at your transistors until they
%           act unpredictably. 
%
%           I have a lot of respect for the CS community. Donald Knuth
%           and Grace Hopper have earned the enduring respect not only from
%           me but from the world. Rightly so. One critique that I graciously 
%           offer is that CS majors tend to assume that hardware works the 
%           way it's supposed to. And that might be true 99.999% of the time.
%           But when you have astronauts in a spacecraft, or babies on
%           a 747, there is no, "Just turn it off and turn it on
%           again." That's why you write software that can tolerate
%           things that should never happen.
%
% That's why rather than think ask, "What is the smallest denominator 
% I can get away with?", I ask, "How small a denominator do I really need?"
% I then go 2 or 3 orders of magnitude smaller than that, and call it done.
% The threshold is an optional parameter, so you can always pass in a 
% different value if you need to.
%
% In summary, this function is short and gives a descriptive name to 
% a simple operation. But it's a really important simple operation.
