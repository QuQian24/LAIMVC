function [HH,alpha1,end_iter] = each_iter(H_last,H_this,num,numclass,t,alpha)
%ITER 此处显示有关此函数的摘要
%   此处显示详细说明
%m=alpha;
maxIter = 100;
Wt=eye(numclass); %单位矩阵
flag = 1;
iter = 0;
alpha1=alpha;
while flag
    iter=iter+1;
    H_next=update_H(H_last,H_this,Wt,alpha1);
    Wt=update_Wt(H_next,H_this);
    alpha1=update_a(H_next,H_this,H_last,Wt);
%     Wt_=update_Wt_(H_last,H_next);
    tmpp=trace(H_next'*(alpha1*H_this*Wt+sqrt(1-alpha1^2)*H_last));
%     tmpp
    obj(iter) = tmpp;
    %tmpp
    if (iter>2) && (abs((obj(iter)-obj(iter-1))/(obj(iter)))<1e-6 || iter>maxIter)
        flag =0;
        end_iter=iter;
    end
end
HH=H_this*Wt;
end
