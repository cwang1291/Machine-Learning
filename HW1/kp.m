function [ v ] = kp( d, t )
sigma=5;
a=ones(length(d(:,1)),1);
for i=1:length(d(:,1))
    if d(i,3)==1
        a(i)=100;
        d(i,3)=100;
    elseif d(i,3)==2
        d(i,3)=1;
    elseif d(i,3)==3
        d(i,3)=-1;
    end
end

for i=13:length(d(:,1))
    if d(i,3)~=100
        sum=0;
        for j=1:i-1
            if a(j)==1 && d(j,3)~=100
                sum=sum+d(j,3)*(exp(-sqrt((d(i,1)-d(j,1))^2+(d(i,2)-d(j,2))^2)/(2*sigma^2)));
            end
        end
    
        if sign(sum)==d(i,3)
            a(i)=0;
        elseif sign(sum)~=d(i,3)
            a(i)=1;
        end
    end
end

for i=1:length(t(:,1))
    sum=0;
    for j=1:length(d(:,1))
        if a(j)==1 && d(j,3)~=100
            sum=sum+d(j,3)*(exp(-sqrt((t(i,1)-d(j,1))^2+(t(i,2)-d(j,2))^2)/(2*sigma^2)));
        end
        
    end
    if sign(sum)>0
            v(i)=2;
    elseif sign(sum)<0
            v(i)=3;
    end
end
v=v';
end

