% implement
% play with parameters -- class input
% try to make it not crash
% explore precision limits
% try fixed point -- few versys many iterations, low and high growth rates,
% perturbed IC
% break out of loop
% add carrying capacity
% T = 10^2; % make T bigger when things seem stable
% K = 10;
% r=2.485;% slowly increase r from 1
% c = 2;
% a = 0.068;
% P1 = 2;
% N1 = 12;

% % fig 3.5
% T = 2000; % make T bigger when things seem stable
% K = 14.47;
% r=.5;
% c = 1;
% q = .4;
% Nbar = K*q;
% Pbar = Nbar*(1-exp(-r*(1-q)));
% a = r*(1-q)/Pbar;
% P1 = 1;
% N1 = 11;

% % fig 3.6--play with P1,N1
% T = 100;
% K = 21.47;
% r=2;
% c = 1;
% q = .4;
% Nbar = K*q;
% Pbar = Nbar*(1-exp(-r*(1-q)));
% a = r*(1-q)/Pbar;
% P1 = 2;
% N1 = 10;

% %fig 3.7
% T = 1000000;
% K = 21.5;
% r=2.5045; % start at 2.2, then 2.5 (cut off first 1000), then 2.45, 2.42, 2.6,2.55,2.53,2.51,2.505 (cut off first 10^5),2.502,2.504,2.4045 (cut off first 9x10^5)
% c = 1;
% q = .4;
% Nbar = K*q;
% Pbar = Nbar*(1-exp(-r*(1-q)));
% a = r*(1-q)/Pbar;
% P1 = 9;
% N1 = 6;

% T = 10^3; % fig 3.8 -- increase T slowly
% K = 22.51;
% r=2.2;
% c = 1.8;
% a = 0.1;
% P1 = 2;
% N1 = 12;

T = 10^5; 
K = 24.97;
r=2.65;
c = 1.8;
a = 0.1;
P1 = 2;
N1 = 12;

%lam = r;
%Pbar = log(lam)/a;
%Nbar = lam * log(lam)/((lam-1)*a*c);

N = zeros(1,T);
P = zeros(1,T);
N(1)=N1;
P(1)=P1;

for t=1:T-1
    lam = exp(r*(1-N(t)/K));
    N(t+1) = lam * N(t) * exp(-a*P(t));
    P(t+1) = c * N(t) * (1- exp(-a*P(t)));
    if min(N(t+1),P(t+1)) < 0
        break
    end
end

close all hidden;
plot(N(1:t+1),'b');
hold on;
plot(P(1:t+1),'r');

figure;
scatter(N(1:t+1),P(1:t+1));