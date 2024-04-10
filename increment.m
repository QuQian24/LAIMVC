function [ZZZZZ,XX,ZZ,BB,HH,avg_time,avg_iter,obj] = increment(X,viewnum,anchornum,samplenum,featurenum)
%increment 增量求解Zt
XX=cell(viewnum,1);
ZZ=cell(viewnum,1);
BB=cell(viewnum,1);
HH=cell(viewnum,1);
time = 0;
iters = 0;
ZZZZZ = cell(viewnum,1);
obj=0;
for t = 1:viewnum
    t %不加分号会直接输出
%     Xi = X{t};
%     di = size(X{t},2);
%     [Xi,~ ]= project(Xi,di,featurenum); %PCA实现降维 第三个参数可改
    Xi = X{t};
    di = size(X{t},2);
    if t==1
        %得到初始化参数
       [Xi,~ ]= project(Xi,di,featurenum);
       [Zt,Bt] = decompose(Xi,samplenum,anchornum);
       Ht=eye(anchornum,anchornum);
       Bt = Schmidt_orthogonalization(Bt);
       Zt = Schmidt_orthogonalization(Zt);
       ZZZZZ{t}=Zt;
       %Ht = Schmidt_orthogonalization(Ht);
    else
        tic;
        [Xi,~ ]= project(Xi,di,featurenum);
        [Zt,ZZZZZ{t},Bt,Ht,iters,obj]= addview(Xi,BB{t-1},ZZ{t-1},HH{t-1},iters,obj);
        toc;
        time=time+toc;
        %iters= iters+tmp_iters;
    end
    %Bt = zscore(Bt);Zt = zscore(Zt);Ht = zscore(Ht);
    %Bt = Schmidt_orthogonalization(Bt);
    %Zt = Schmidt_orthogonalization(Zt);
    %Ht = Schmidt_orthogonalization(Ht);
    %Ht'*Ht
    ZZ{t} = Zt;
    BB{t} = Bt;
    HH{t} = Ht;
end
avg_time=time/(viewnum-1);%第一个视图为初始化视图，不算入平均时间
avg_iter=iters/(viewnum-1);
% Z_final = HH{viewnum}./ repmat(sqrt(sum(H.^2, 2)), 1,k);
% 后续考虑是否需要进行
end

