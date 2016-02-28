data=[x,y,z];
k=3;
a=linkage(data,'median','euclidean');
label=cluster(a,'maxclust',3);
for i=1:5903
    if label(i)==1
        scatter3(x(i),y(i),z(i),'g.');
        hold on
    elseif label(i)==2
        scatter3(x(i),y(i),z(i),'r.');
        hold on
    
    else
        scatter3(x(i),y(i),z(i),'b.');
        hold on
    end
end