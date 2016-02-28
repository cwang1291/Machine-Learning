totaldata=Xtest;
%% extract feasible features
data(:,1:3172)=totaldata(:,provideIdx(1:3172));
%% center data
for i=1:1001
    D(i,:)=data(i,:)-mean(data);
end
for i=1:1000
    d(i,:)=provideData(i,:)-mean(data);
end
%% find covariance
cov=D'*D/1502;
%% do PCA
PCN=50;
[evector,~]=svds(cov,PCN);
%% project data
weights=D*evector;
testweights=d*evector;
%% build model and predict
for i=1:2731
    i
    x=weights;
    y=totaldata(:,missIdx(i));
    model=fitlm(x,y);
    prediction2(:,i)=predict(model,testweights);
    i
end
