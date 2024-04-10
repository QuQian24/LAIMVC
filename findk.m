function [k,kmax] = findk(X,classnum)
%UNTITLED 此处提供此函数的摘要
%   此处提供详细说明
min_di = inf; % 初始化为无穷大
for i = 1:size(X,1)
    di = size(X{i}, 2); % 获取第i个矩阵的列数，即 di
    min_di = min(min_di, di);
end
%处理数据低维的特殊情况
if min_di > classnum
    k = classnum;
    kmax = min_di;
else
    k = min_di;
    kmax = min_di;
end