function [Ht_next] = update_H(Bt_last,Bt_next,Zt_last,Zt_next)
%UPDATE_Z 此处显示有关此函数的摘要
%   此处显示详细说明
D=Zt_last'*Zt_next+Bt_last*Bt_next';
[Up,Sp,Vp] = svd(D,'econ');
Ht_next = Up*Vp';
end

