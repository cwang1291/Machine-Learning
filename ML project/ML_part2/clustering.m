

a=[];
b=[];
c=[];

data=[Xtrain;Xtest];
for i=1:2731
    data(:,missIdx(2732-i))=[];
end

K=3;
y=kmeans(data,K);
for i=1:1502
    if y(i)==1
        a=[a;data(i,:)];
   elseif y(i)==2
        b=[b;data(i,:)];
    else
        c=[c;data(i,:)];
    end
end

meanA=mean(a);
meanB=mean(b);
meanC=mean(c);

for i=1:1000
    [~,w(i)]=min([pdist([provideData(i,:);meanA]),pdist([provideData(i,:);meanB]),pdist([provideData(i,:);meanC])]);
end

       
a=[];
b=[];
c=[];

data=[Xtrain;Xtest];
for i=1:3172
    data(:,provideIdx(3173-i))=[];
end
for i=1:1502
    if y(i)==1
        a=[a;data(i,:)];
   elseif y(i)==2
        b=[b;data(i,:)];
    else
        c=[c;data(i,:)];
    end
end

meanA=mean(a);
meanB=mean(b);
meanC=mean(c);

output=zeros(1000,2731);
for i=1:1000
    if w(i)==1
        output(i,:)=meanA;
    elseif w(i)==2
        output(i,:)=meanB;
    else
        output(i,:)=meanC;
    end
end
