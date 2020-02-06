f = 2 * 10^(-3);
% S0 = 1/f+1000;
% C0 = B;
S0 = 20000;
C0 = 20;
B = 360/(S0+C0);
T = 200;

S = zeros(1,T);
C = zeros(1,T);
S(1) = S0;
C(1) = C0;

for t=1:T-1
    C(t+1) = f*S(t)*C(t);
    S(t+1) = S(t) - f*S(t)*C(t) + B;
    if C(t+1) < 1 || S(t+1) > 10 * S0
        break
    end
end

clf
plot(S(1:t+1));
hold on;
plot(C(1:t+1));