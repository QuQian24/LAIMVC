function [Zt_next] = update_Z(Xt,Bt,Zt,Ht)
%UPDATE_Z �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
A=Xt*Bt'+Zt*Ht;
[Up,Sp,Vp] = svd(A,'econ');
Zt_next = Up*Vp';
end

