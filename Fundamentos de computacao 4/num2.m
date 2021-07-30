a=1e-8;
b=-0.8;
c=1e-8;

delta = sqrt(b*b-4*a*c);

if (delta<0)
  "Nao possui raizes reais"
  return
endif

if (b<0)
  delta=delta*(-1);
endif

x1=(-b-delta)/(2*a);
x2= c / (a * x1);

"Raizes"
x1
x2