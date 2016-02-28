
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

for i=1:2731
    ione=i
    x=a(:,1:10:3000);
    y=aaa(:,i);
    model=fitlm(x,y);
    predictionA(:,i)=predict(model,aa(:,1:10:3000));
end

for i=1:2731
    itwo=i
    x=b(:,1:10:3000);
    y=bbb(:,i);
    model=fitlm(x,y);
    predictionB(:,i)=predict(model,bb(:,1:10:3000));
end

for i=1:2731
    ithree=i
    x=c(:,1:10:3000);
    y=ccc(:,i);
    model=fitlm(x,y);
    predictionC(:,i)=predict(model,cc(:,1:10:3000));
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