function [F, Q] = VanLoan(A, G, D, Ts)
% Discretizes a stochastic LTI system.
% arg A: nxn array of floats, continous time transition matrix
% arg G: nxk array of floats, continous time process noise gain
% arg D: kxk array of floats, continous time process noise covariance
% arg Ts: float, sampling time
% return F: nxn array of floats
% return Q: nxn array of floats
n = size(A, 1);
M = expm([-A G*D*G'; zeros(n, n) A']*Ts);
V1 = M(n+1:2*n, n+1:2*n);
V2 = M(1:n, n+1:2*n);

F = V1';
Q = F*V2;
end

