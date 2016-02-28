function [ v ] = lp( d, t )
W=[0,1,0];

for i=1:length(d(:,1))
    if d(i,3)~=1
        if  d(i,3)==2 
            x=d(i,1);
            y=d(i,2);
            L=1;
        elseif d(i,3)==3
            x=d(i,1);
            y=d(i,2);
            L=-1;
        end
        D=[x,y,1];
        if sign(W*D')~=L
            W=W+L*D*0.005;
        end
    end
end

for i=1:length(t(:,1))
    x=t(i,1);
    y=t(i,2);
    D=[x,y,1];
    if W*D'<0
        v(i)=2;
    else
        v(i)=3;
    end
end
v=v';
a=t(:,1);
b=t(:,2);
scatter(a,b);
hold on
x=[4:0.1:8];
y=(-W(3)-W(1)*x)/W(2);
plot(x,y);



end
