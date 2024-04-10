function [Zt1,ZZZZ,Bt1,Ht1,end_iters,obj]= addview(Xt,Bt,Zt,Ht,iters,obj)
%addview 增加视图最优化的过程
maxIter = 500;
flag = 1;
iter = iters;
Bt_last = Bt;
Zt_last = Zt;%last是t-1个视图得到的结果，不会变化
Bt_next = Bt;
Zt_next = Zt;
Ht_next = Ht;
its=1;
ZZZZ{its}=Zt;
while flag
    if (iter==iters)
        iter=iter+1;
        obvalue = trace((Xt-Zt_next*Bt_next)'*(Xt-Zt_next*Bt_next)) + trace((Zt_next-Zt_last*Ht_next)'*(Zt_next-Zt_last*Ht_next))+trace((Bt_next-Ht_next*Bt_last)'*(Bt_next-Ht_next*Bt_last));
        obj(iter) = obvalue;
    end
    Zt_next = update_Z(Xt,Bt_next,Zt_last,Ht_next);
    its=its+1;
    ZZZZ{its}=Zt_next;
    
    iter=iter+1;
    obvalue = trace((Xt-Zt_next*Bt_next)'*(Xt-Zt_next*Bt_next)) + trace((Zt_next-Zt_last*Ht_next)'*(Zt_next-Zt_last*Ht_next))+trace((Bt_next-Ht_next*Bt_last)'*(Bt_next-Ht_next*Bt_last));
    obj(iter) = obvalue;
    Bt_next = update_B(Xt,Bt_last,Zt_next,Ht_next);
    iter=iter+1;
    obvalue = trace((Xt-Zt_next*Bt_next)'*(Xt-Zt_next*Bt_next)) + trace((Zt_next-Zt_last*Ht_next)'*(Zt_next-Zt_last*Ht_next))+trace((Bt_next-Ht_next*Bt_last)'*(Bt_next-Ht_next*Bt_last));
    obj(iter) = obvalue;
    %obvalue = trace((Xt-Zt_next*Bt_next)'*(Xt-Zt_next*Bt_next)) + trace((Zt_next-Zt_last*Ht)'*(Zt_next-Zt_last*Ht))+trace((Bt_next-Ht*Bt_last)'*(Bt_next-Ht*Bt_last))
    Ht_next=update_H(Bt_last,Bt_next,Zt_last,Zt_next);
    iter=iter+1;
    obvalue = trace((Xt-Zt_next*Bt_next)'*(Xt-Zt_next*Bt_next)) + trace((Zt_next-Zt_last*Ht_next)'*(Zt_next-Zt_last*Ht_next))+trace((Bt_next-Ht_next*Bt_last)'*(Bt_next-Ht_next*Bt_last));
    obj(iter) = obvalue;
   
    %tmpp
    %if (iter>2) && (abs((obj(iter)-obj(iter-1))/(obj(iter)))<1e-6 || iter>maxIter)
    if (iter>2) && (abs((obj(iter-3)-obj(iter))/(obj(iter)))<1e-6 || iter>maxIter)
        flag =0;
        end_iters=iter;
    end
end

Zt1 = Zt_next;
Bt1 = Bt_next;
Ht1 = Ht_next;
end