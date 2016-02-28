function [ v ] = nb( d, t )

for i=1:length(d(:,1)-1)  %split training data into three catagories with each has it's L and W
    if d(i,3)==1
        L1(i)=d(i,1);
        W1(i)=d(i,2);
    elseif d(i,3)==2
        L2(i)=d(i,1);
        W2(i)=d(i,2);
    end
end
L1(L1==0) = [];
W1(W1==0) = [];
L2(L2==0) = [];
W2(W2==0) = [];


mean1= [ sum(L1)/length(L1) ; sum(W1)/length(W1) ];
mean2= [ sum(L2)/length(L2) ; sum(W2)/length(W2) ];
cov1=cov(L1,W1);
cov2=cov(L2,W2);

for i=1:length(t(:,1))
    p1=((2*3.1416*(det(cov1))^0.5)^-1)*exp(-0.5*(t(i,:)'-mean1)'*inv(cov1)*(t(i,:)'-mean1));
    p2=((2*3.1416*(det(cov2))^0.5)^-1)*exp(-0.5*(t(i,:)'-mean2)'*inv(cov2)*(t(i,:)'-mean2));
    P=[p1,p2];
    [~,v(i)]=max(P);
    v=v';
end
