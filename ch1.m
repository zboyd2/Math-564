% % 1, second-order relation
% x1 = 1;
% x2 = 1;
% b = .1;
% a = -.1;
% N = 20;
% 
% x = zeros(N,1);
% x(1)=x1;
% x(2)=x2;
% 
% for n=3:N
%     x(n)=b*x(n-1)+a*x(n-2);
% end
% 
% x'
% plot(x)
% 
% % get the eigenvalues
% d = sqrt(b^2 + 4*a);
% ( b + d ) / 2
% ( b - d ) / 2

% % second-order system
%x0 = [1;1];
x0 = -V(:,1);
M = [1 1; 1 0];
N = 20;
x = zeros(2,N);
x(:,1)=x0;

for n=2:N
    x(:,n)=M*x(:,n-1);
end

x
plot(x')

% get eigenvalues
[V,D] = eig(M);
diag(D)