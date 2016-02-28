function prediction=train(Xtrain,Ytrain)


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


traindataX11=Xtrain;
traindataY11=Ytrain;
traindataX12=Xtrain;
traindataY12=Ytrain;
traindataX13=Xtrain;
traindataY13=Ytrain;
traindataX14=Xtrain;
traindataY14=Ytrain;
traindataX15=Xtrain;
traindataY15=Ytrain;
traindataX16=Xtrain;
traindataY16=Ytrain;
traindataX17=Xtrain;
traindataY17=Ytrain;
traindataX18=Xtrain;
traindataY18=Ytrain;
traindataX19=Xtrain;
traindataY19=Ytrain;
traindataX20=Xtrain;
traindataY20=Ytrain;


for i=1:501
    if rem(i,20)==1
        traindataX1(502-i,:)=[];
        traindataY1(502-i)=[];
    elseif rem(i,20)==2
        traindataX2(502-i,:)=[];
        traindataY2(502-i)=[];
    elseif rem(i,20)==3
        traindataX3(502-i,:)=[];
        traindataY3(502-i)=[];
    elseif rem(i,20)==4
        traindataX4(502-i,:)=[];
        traindataY4(502-i)=[];
    elseif rem(i,20)==5
        traindataX5(502-i,:)=[];
        traindataY5(502-i)=[];
    elseif rem(i,20)==6
        traindataX6(502-i,:)=[];
        traindataY6(502-i)=[];
    elseif rem(i,20)==7
        traindataX7(502-i,:)=[];
        traindataY7(502-i)=[];
    elseif rem(i,20)==8
        traindataX8(502-i,:)=[];
        traindataY8(502-i)=[];
    elseif rem(i,20)==9
        traindataX9(502-i,:)=[];
        traindataY9(502-i)=[];
    elseif rem(i,20)==10
        traindataX10(502-i,:)=[];
        traindataY10(502-i)=[];
    elseif rem(i,20)==11
        traindataX11(502-i,:)=[];
        traindataY11(502-i)=[];
    elseif rem(i,20)==12
        traindataX12(502-i,:)=[];
        traindataY12(502-i)=[];
    elseif rem(i,20)==13
        traindataX13(502-i,:)=[];
        traindataY13(502-i)=[];
    elseif rem(i,20)==14
        traindataX14(502-i,:)=[];
        traindataY14(502-i)=[];
    elseif rem(i,20)==15
        traindataX15(502-i,:)=[];
        traindataY15(502-i)=[];
    elseif rem(i,20)==16
        traindataX16(502-i,:)=[];
        traindataY16(502-i)=[];
    elseif rem(i,20)==17
        traindataX17(502-i,:)=[];
        traindataY17(502-i)=[];
    elseif rem(i,20)==18
        traindataX18(502-i,:)=[];
        traindataY18(502-i)=[];
    elseif rem(i,20)==19
        traindataX19(502-i,:)=[];
        traindataY19(502-i)=[];
    elseif rem(i,20)==0
        traindataX20(502-i,:)=[];
        traindataY20(502-i)=[];
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
model11=svmtrain(traindataY11,traindataX11,'-g 3.0518e-05 -t 2 -c 8');
model12=svmtrain(traindataY12,traindataX12,'-g 3.0518e-05 -t 2 -c 8');
model13=svmtrain(traindataY13,traindataX13,'-g 3.0518e-05 -t 2 -c 8');
model14=svmtrain(traindataY14,traindataX14,'-g 3.0518e-05 -t 2 -c 8');
model15=svmtrain(traindataY15,traindataX15,'-g 3.0518e-05 -t 2 -c 8');
model16=svmtrain(traindataY16,traindataX16,'-g 3.0518e-05 -t 2 -c 8');
model17=svmtrain(traindataY17,traindataX17,'-g 3.0518e-05 -t 2 -c 8');
model18=svmtrain(traindataY18,traindataX18,'-g 3.0518e-05 -t 2 -c 8');
model19=svmtrain(traindataY19,traindataX19,'-g 3.0518e-05 -t 2 -c 8');
model20=svmtrain(traindataY20,traindataX20,'-g 3.0518e-05 -t 2 -c 8');
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

label11=svmpredict(Y,Xtest,model11);
label12=svmpredict(Y,Xtest,model12);
label13=svmpredict(Y,Xtest,model13);
label14=svmpredict(Y,Xtest,model14);
label15=svmpredict(Y,Xtest,model15);
label16=svmpredict(Y,Xtest,model16);
label17=svmpredict(Y,Xtest,model17);
label18=svmpredict(Y,Xtest,model18);
label19=svmpredict(Y,Xtest,model19);
label20=svmpredict(Y,Xtest,model20);
label=[label1,label2,label3,label4,label5,label6,label7,label8,label9,label10,label11,label12,label13,label14,label15,label16,label17,label18,label19,label20];
prediction=zeros(1001,3);
for i=1:1001
    prediction(i,1)=sum(double(label(i,:)==0))/20;
    prediction(i,2)=sum(double(label(i,:)==1))/20;
    prediction(i,3)=sum(double(label(i,:)==3))/20;
end

end