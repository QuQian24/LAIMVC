function [Ht_next] = update_H(Bt_last,Bt_next,Zt_last,Zt_next)
%UPDATE_Z �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
D=Zt_last'*Zt_next+Bt_last*Bt_next';
[Up,Sp,Vp] = svd(D,'econ');
Ht_next = Up*Vp';
end

