function [Zt,Bt] = decompose(X,n,m)
%decompose X:n*k,分解为m个锚点的图Zt:n*m以及锚矩阵m*k
[~, Bt] = kmeans(X, m);
%Zt = zeros(n, m);
Zt = X * pinv(Bt); %如果Bt不是满秩的，可能有多个结果
% 显示结果
%disp('锚矩阵 B:');
%disp(B);
%disp('锚图 Z:');
%disp(Z);
end