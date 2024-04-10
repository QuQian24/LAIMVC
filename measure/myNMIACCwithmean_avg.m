function [final_avg,final_std]= myNMIACCwithmean_avg(U,Y,numclass)

stream = RandStream.getGlobalStream;
reset(stream);
U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1,size(U,2));
maxIter = 50;

for iter = 1:maxIter
    indx = litekmeans(U_normalized,numclass,'MaxIter',100, 'Replicates',1);
    %     indx = kmeans(U_normalized,numclass,'MaxIter',100, 'Replicates',1);
    indx = indx(:);
    result(iter,:) = Clustering8Measure(Y,indx); % result = [ACC nmi Purity Fscore Precision Recall AR Entropy];
end
final_avg= result(1,:);
final_std=result(1,:);
for cnt=1:8
    final_avg(cnt)=mean(result(:,cnt),1)';
    final_std(cnt)=std(result(:,cnt),1)';
end