iter=1;
while isempty(Xtrain)~=1



for i=1:1001
    for j=1:3
        if prediction(i,j)>0.7
            Xtrain=[Xtrain,Xtest(i,:)];
            Ytrain=[Ytrain;Ytest(i)];
        end
    end
end



%% extract feasible features
data(:,1:3172)=totaldata(:,provideIdx(1:3172));
%% center data
for i=1:size(data,1)
    D(i,:)=data(i,:)-mean(data);
end
for i=1:1000
    d(i,:)=provideData(i,:)-mean(provideData);
end
%% find covariance
cov=D'*D/size(data,1);
%% do PCA
PCN=10;
[evector,~]=svds(cov,PCN);
%% project data
weights=D*evector;
testweights=d*evector;
%% build model and predict
for i=1:2731
    x=weights;
    y=totaldata(:,missIdx(i));
    model=fitlm(x,y);
    prediction10(:,i)=predict(model,testweights);
end
prediction=train(Xtrain,Ytrain);
remain=size(Xtrain,1)
iter=iter+1

end