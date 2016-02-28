data=[x,y,z];
k=3;
a=[];b=[];c=[];d=[];e=[];f=[];LA=[];LB=[];LC=[];testA=[];testB=[];testC=[];prediction=[];
A=linkage(data,'median','euclidean');
label=cluster(A,'maxclust',3);
traindata=Xtest;
for i=1:5903
    if any(i==missIdx)==0 && label(i)==1
        a=[a,traindata(:,i)];
        testA=[testA,provideData(:,1)];
        provideData(:,1)=[];
        if sum(provideData)==0
            provideData=100000;
        end
    elseif any(i==missIdx)==1 && label(i)==1
        b=[b,traindata(:,i)];
        LA=[LA,i];
    elseif any(i==missIdx)==0 && label(i)==2
        c=[c,traindata(:,i)];
        testB=[testB,provideData(:,1)];
        provideData(:,1)=[];
        if sum(provideData)==0
            provideData=100000;
        end
    elseif any(i==missIdx)==1 && label(i)==2
        d=[d,traindata(:,i)];
        LB=[LB,i];
    elseif any(i==missIdx)==0 && label(i)==3
        e=[e,traindata(:,i)];
        testC=[testC,provideData(:,1)];
        provideData(:,1)=[];
        if sum(provideData)==0
            provideData=100000;
        end
    elseif any(i==missIdx)==1 && label(i)==3
        f=[f,traindata(:,i)];
        LC=[LC,i];
    end
end

for i=1:5903
    
    if any(LA==i)==1 
        x=a(:,1:200);
        y=b(:,1);
        model=fitlm(x,y);
        b(:,1)=[];
        if sum(b)==0
            b=10000;
        end
        p=predict(model,testA(:,1:200));
        prediction=[prediction,p];
    elseif  any(LB==i)==1 
        x=c(:,1:200);
        y=d(:,1);
        model=fitlm(x,y);
        d(:,1)=[];
        if sum(d)==0
            d=10000;
        end
        p=predict(model,testB(:,1:200));
        prediction=[prediction,p];
    elseif any(LC==i)==1 
        x=e(:,1:200);
        y=f(:,1);
        model=fitlm(x,y);
        f(:,1)=[];
        if sum(f)==0
            f=10000;
        end
        p=predict(model,testC(:,1:200));
        prediction=[prediction,p];
    end
    
    if sum(prediction)~=0
        size(prediction,2)
    end
end