clear
clc
load('Train.mat');
load('Test.mat');
C=2^-7;
g=2^-17;
for k=1:11
    for j=1:10
        C=C*4
        g=g*4;
        traindataX1=Xtrain;
        traindataY1=Ytrain;
        traindataX2=Xtrain;
        traindataY2=Ytrain;
        for i=1:501 
            if rem(i,2)==0
                traindataX1(502-i,:)=[];
                traindataY1(502-i)=[];
            elseif rem(i,2)==1
                traindataX2(502-i,:)=[];
                traindataY2(502-i)=[];
            end
        end
        str=sprintf('-g %f -t 2 -c %f',C,g);
        model1=svmtrain(traindataY1,traindataX1,str);
        model2=svmtrain(traindataY2,traindataX2,str);
        [label1,accuracy1,prob1]=svmpredict(traindataY2,traindataX2,model1);
        [label2,accuracy2,prob2]=svmpredict(traindataY1,traindataX1,model2);
        accuracy(k,j)=(accuracy1(1)+accuracy2(1))/2;
    end
end
        
        
        