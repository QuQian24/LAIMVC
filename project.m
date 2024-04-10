function [X,coeffMx] = project(X,~,featurenum)
%project 对新到达的视图数据进行降维投影从d维至k维
%   选取经典的降维方法 PCA
X = zscore(X);
coeff = pca(X);
coeffMx = coeff(:,1:featurenum);
reduced_data = X*coeffMx;
X = reduced_data;

end
