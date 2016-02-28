
%% clustering
traindata=[Xtrain;Xtest];

trainlabel=[Ytrain;Ytest];
a=[];
b=[];
c=[];
aa=[];
bb=[];
cc=[];
aaa=[];
bbb=[];
ccc=[];
testlabelA=[];
testlabelB=[];
testlabelC=[];
data(:,1:3172)=traindata(:,provideIdx(1:3172));
DATA(:,1:2731)=traindata(:,missIdx(1:2731));
for i=1:1502
    if trainlabel(i)==0
        a=[a;data(i,:)];
        aaa=[aaa;DATA(i,:)];
    elseif trainlabel(i)==1
        b=[b;data(i,:)];
        bbb=[bbb;DATA(i,:)];
    else
        c=[c;data(i,:)];
        ccc=[ccc;DATA(i,:)];
    end
end

meanA=mean(a);
meanB=mean(b);
meanC=mean(c);
for i=1:1000
    D(1,i)=pdist([provideData(i,:);meanA]);
    D(2,i)=pdist([provideData(i,:);meanB]);
    D(3,i)=pdist([provideData(i,:);meanC]);
end

for i=1:1000
    [~,n]=min(D(:,i));
    if n==1
        aa=[aa;provideData(i,:)];
        testlabelA=[testlabelA,i];
    elseif n==2
        bb=[bb;provideData(i,:)];
        testlabelB=[testlabelB,i];
    else
        cc=[cc;provideData(i,:)];
        testlabelC=[testlabelC,i];
    end
end

%% center data
for i=1:size(a,1)
    trainA(i,:)=a(i,:)-mean(a);
end
for i=1:size(b,1)
    trainB(i,:)=b(i,:)-mean(b);
end
for i=1:size(c,1)
    trainC(i,:)=c(i,:)-mean(c);
end
for i=1:size(aa,1)
    testA(i,:)=aa(i,:)-mean(a);
end
for i=1:size(bb,1)
    testB(i,:)=bb(i,:)-mean(b);
end
for i=1:size(cc,1)
    testC(i,:)=cc(i,:)-mean(c);
end
%% find covariance
covA=trainA'*trainA/size(trainA,1);
covB=trainB'*trainB/size(trainB,1);
covC=trainC'*trainC/size(trainC,1);
%% do PCA
PCN=50;
[evectorA,~]=svds(covA,PCN);
[evectorB,~]=svds(covB,PCN);
[evectorC,~]=svds(covC,PCN);
%% project data
weightsA=trainA*evectorA;
weightsB=trainB*evectorB;
weightsC=trainC*evectorC;
testweightsA=testA*evectorA;
testweightsB=testB*evectorB;
testweightsC=testC*evectorC;

for i=1:2731
    ione=i
    x=weightsA;
    y=aaa(:,i);
    model=fitlm(x,y);
    predictionA(:,i)=predict(model,testweightsA);
end

for i=1:2731
    itwo=i
    x=weightsB;
    y=bbb(:,i);
    model=fitlm(x,y);
    predictionB(:,i)=predict(model,testweightsB);
end

for i=1:2731
    ithree=i
    x=weightsC;
    y=ccc(:,i);
    model=fitlm(x,y);
    predictionC(:,i)=predict(model,testweightsC);
end

for i=1:1000
    if testlabelA(1)==i;
        prediction3(i,:)=predictionA(1,:);
        predictionA(1,:)=[];
        testlabelA(1)=[];
        if sum(testlabelA)==0
            testlabelA=10000;
        end
    elseif testlabelB(1)==i
        prediction3(i,:)=predictionB(1,:);
        testlabelB(1)=[];
        predictionB(1,:)=[];
        if sum(testlabelB)==0
            testlabelB=10000;
        end
    elseif testlabelC(1)==i
        prediction3(i,:)=predictionC(1,:);
        testlabelC(1)=[];
        predictionC(1,:)=[];
        if sum(testlabelC)==0
            testlabelC=10000;
        end
    end
end