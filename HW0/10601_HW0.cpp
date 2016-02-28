function [w1, w2] = ulr(x, y)
int sumx=0;
int sumy=0;
int n=sizeof(x);
for(i=1;i<=n;i++)
{
    sumy=sumy+y[i];
    sumx=sumx+x[i];
}
double xm=sumx/n;
double ym=sumy/n;
int uppersum=0;
int lowersum=0;
for(j=0;j<n;j++)
{
    uppersum=uppersum+((x[j]-xm)*(y[j]-ym));
    lowersum=lowersum+((x[j]-xm)*(x[j]-xm));
}
double w1=uppersum/lowersum;
double w2=ym-w1*xm;
return [w1,w2];
