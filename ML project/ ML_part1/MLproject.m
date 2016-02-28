clear
clc
load('Train.mat');
load('Test.mat');

traindataX1=Xtrain;
traindataY1=Ytrain;
traindataX2=Xtrain;
traindataY2=Ytrain;
traindataX3=Xtrain;
traindataY3=Ytrain;
traindataX4=Xtrain;
traindataY4=Ytrain;
traindataX5=Xtrain;
traindataY5=Ytrain;
traindataX6=Xtrain;
traindataY6=Ytrain;
traindataX7=Xtrain;
traindataY7=Ytrain;
traindataX8=Xtrain;
traindataY8=Ytrain;
traindataX9=Xtrain;
traindataY9=Ytrain;
traindataX10=Xtrain;
traindataY10=Ytrain;
for i=1:501
    if rem(i,10)==1
        traindataX1(502-i,:)=[];
        traindataY1(502-i)=[];
    elseif rem(i,10)==2
        traindataX2(502-i,:)=[];
        traindataY2(502-i)=[];
    elseif rem(i,10)==3
        traindataX3(502-i,:)=[];
        traindataY3(502-i)=[];
    elseif rem(i,10)==4
        traindataX4(502-i,:)=[];
        traindataY4(502-i)=[];
    elseif rem(i,10)==5
        traindataX5(502-i,:)=[];
        traindataY5(502-i)=[];
    elseif rem(i,10)==6
        traindataX6(502-i,:)=[];
        traindataY6(502-i)=[];
    elseif rem(i,10)==7
        traindataX7(502-i,:)=[];
        traindataY7(502-i)=[];
    elseif rem(i,10)==8
        traindataX8(502-i,:)=[];
        traindataY8(502-i)=[];
    elseif rem(i,10)==9
        traindataX9(502-i,:)=[];
        traindataY9(502-i)=[];
    elseif rem(i,10)==0
        traindataX10(502-i,:)=[];
        traindataY10(502-i)=[];
    end
end
model1=svmtrain(traindataY1,traindataX1,'-g 3.0518e-05 -t 2 -c 8');
model2=svmtrain(traindataY2,traindataX2,'-g 3.0518e-05 -t 2 -c 8');
model3=svmtrain(traindataY3,traindataX3,'-g 3.0518e-05 -t 2 -c 8');
model4=svmtrain(traindataY4,traindataX4,'-g 3.0518e-05 -t 2 -c 8');
model5=svmtrain(traindataY5,traindataX5,'-g 3.0518e-05 -t 2 -c 8');
model6=svmtrain(traindataY6,traindataX6,'-g 3.0518e-05 -t 2 -c 8');
model7=svmtrain(traindataY7,traindataX7,'-g 3.0518e-05 -t 2 -c 8');
model8=svmtrain(traindataY8,traindataX8,'-g 3.0518e-05 -t 2 -c 8');
model9=svmtrain(traindataY9,traindataX9,'-g 3.0518e-05 -t 2 -c 8');
model10=svmtrain(traindataY10,traindataX10,'-g 3.0518e-05 -t 2 -c 8');
Y=ones(1001,1);
label1=svmpredict(Y,Xtest,model1);
label2=svmpredict(Y,Xtest,model2);
label3=svmpredict(Y,Xtest,model3);
label4=svmpredict(Y,Xtest,model4);
label5=svmpredict(Y,Xtest,model5);
label6=svmpredict(Y,Xtest,model6);
label7=svmpredict(Y,Xtest,model7);
label8=svmpredict(Y,Xtest,model8);
label9=svmpredict(Y,Xtest,model9);
label10=svmpredict(Y,Xtest,model10);
label=[label1,label2,label3,label4,label5,label6,label7,label8,label9,label10];
prediction=zeros(1001,3);
for i=1:1001
    prediction(i,1)=sum(double(label(i,:)==0))/10;
    prediction(i,2)=sum(double(label(i,:)==1))/10;
    prediction(i,3)=sum(double(label(i,:)==3))/10;
end