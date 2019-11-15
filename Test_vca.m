function [varargout] = Test_vca(varargin)
%Test_vca Tests VCA
%
% USAGE:
%   [V, F] = Test_vca(N, r, e, maxIter, [testName]);
%
% INPUTS:
%   Sm - R(N, d) matrix : input data
%   e - R : tolerance
%   maxIter : N - Maximum number of iterations
%   testName - string
%
% OUTPUTS:
%   V - vanishing components
%   F - non-vanishing components

% Copyright 2013 Denso IT Laboratory, Inc.

% CHANGE LOG:
% [001] 2013/07/24, Hiroshi Tsukahara, Created.
% [002] 2013/07/28, Hiroshi Tsukaahra, Modified so that the test data are given as an argument.
% [003] 2013/07/30, Hiroshi Tsukahara, Sets a limit for iterations.


Sm = varargin{1};
e = 5;
maxIter = Inf;
testName = 'Test_vca';

plotFlag = 0;

if nargin > 1
    e = varargin{2};
end

if length(varargin) > 2
    maxIter = varargin{3};
end

if nargin > 3
    testName = varargin{4};
end

d = size(Sm, 2);
Lm = zeros(d, 1);
for k = 1 : d
    Lm(k) = 1.5 * sqrt(max(Sm(:, k) .* Sm(:, k)));
end

[V, F] = vca(Sm, e, maxIter);

disp('Vanishing Compoments');
for k = 1 : length(V)
    s = ['V[' num2str(k) ']: ' Polynomial_disp(V{k})];
    disp(s);
end

N = size(Sm, 1);
filename = [testName '.N-' num2str(N) '_e-' num2str(e) '.mat'];
save(filename, 'V', 'F', 'Sm', 'e');

varargout{1} = V;
varargout{2} = F;

o = '[';
s = 'ndgrid(';
for k = 1 : d
   if k > 1
       o = [o ', '];
       s = [s ', '];
   end
   o = [o 'g' num2str(k)];
   s = [s '-' num2str(Lm(k)) ':' num2str(Lm(k)) '/50:' num2str(Lm(k))];
end
