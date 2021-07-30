alpha = 1/10;
x = 0.0001;
Y = 0;
e = eps;
t = x^x;
H = 1;
do
  H = alpha * H;
  Y = (x+H)^(x+H);
  DELTA = H^2 + (Y - t)^2;
until DELTA <= e
D = (Y - t)/H;
D