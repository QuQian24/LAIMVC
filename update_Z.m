function [Zt_next] = update_Z(Xt,Bt,Zt,Ht)
%UPDATE_Z 此处显示有关此函数的摘要
%   此处显示详细说明
A=Xt*Bt'+Zt*Ht;
[Up,Sp,Vp] = svd(A,'econ');
Zt_next = Up*Vp';
end

