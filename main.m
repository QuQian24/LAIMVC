clear
clc
warning off;
clear
clc
warning off;
path = './';
addpath(genpath(path));
ResSavePath = 'res/';
if(~exist(ResSavePath,'file'))
    mkdir(ResSavePath);
    addpath(genpath(ResSavePath));
end
datasetName = {'Yale'};

for dataIndex = 1 : length(datasetName)
    dataName =  datasetName{dataIndex};
    
    load(['.\dataset\',dataName ,'.mat'],'X','Y');
    classnum = length(unique(Y));
    [k,kmax] = findk(X,classnum);
    viewnum = size(X,1);
    samplenum = size(X{1},1);
    anchornum = k;%2*k,3k
    featurenum = k;
    if featurenum <= kmax
          [ZZZZZ,XX,ZZ,BB,HH,avg_time,avg_iter,obj] = increment(X,viewnum,anchornum,samplenum,featurenum);
           res = myNMIACCwithmean(ZZ{viewnum}, Y, classnum);
           resFile = [ResSavePath,dataName, '.mat'];
           save(resFile,'ZZZZZ','res','ZZ','BB','HH','avg_time','avg_iter','obj');
     end
end

