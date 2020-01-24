x1 = .1;
r=3.98;
N =4000;

x = zeros(N,1);
x(1)=x1;

for n=2:N
    x(n)=r*x(n-1)*(1-x(n-1));
end

x'
plot(x)
axis([1 N 0.0 1.0]);

histogram(x,100)