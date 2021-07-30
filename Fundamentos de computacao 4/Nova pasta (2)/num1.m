k =1;
x(k)= 0.5;
do
  y=x(k)*x(k)*x(k)*x(k)-12*x(k)*x(k)*x(k)+47*x(k)*x(k)-60*x(k);
  y2=2*x(k);  
  x(k+1)=x(k)-y/y2;
  k=k+1;
until (norm(y)<=10e-4);
x