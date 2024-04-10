function [Bt_next] = update_B(Xt,Bt,Zt,Ht)
%UPDATE_Z 此处显示有关此函数的摘要
%   此处显示详细说明
C=Zt'*Xt+Ht'*Bt;
[Up,Sp,Vp] = svd(C,'econ');
Bt_next = Up*Vp';
end