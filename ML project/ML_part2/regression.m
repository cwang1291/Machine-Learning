%%
totaldata=[Xtrain;Xtest];
data=totaldata(:,provideIdx(1:3172));

prediction=zeros(1000,2731);


featureN=200;
choice=randperm(3172,featureN);
for i=1:2731
    D=zeros(1502,featureN);
    trainingdata=data(:,choice(1:featureN));
    testdata=provideData(:,choice(1:featureN));
    model=fitrsvm(trainingdata,totaldata(:,missIdx(i)));
    prediction(:,i)=predict(model,testdata);
    i
end




%% PCA
%{

for i=1:size(data,1)
    D(i,:)=data(i,:)-mean(data);
end

cov=D'*D/1502;
[evector,evalue]=eig(cov);

PCN=50;

for i=1:PCN
    pc(:,i)=evector(:,size(evector,2)+1-i);
end

weights=D*pc;
%}