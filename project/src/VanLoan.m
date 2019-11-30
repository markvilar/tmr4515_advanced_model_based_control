function [Ad, Bd, Qd] = VanLoan(A, B, G, D, Ts)
% Discretization of stochastic LTI systems using Van Loans method.
% arg A: nxn array of floats, continuous time transition matrix
% arg B: nxj array of floats, continuous time input matrix
% arg G: nxk array of floats, continuous time process noise gain matrix
% arg D: kxk array of floats, continuous time process noise covariances
% arg Ts: float, sampling time
% return Ad: nxn array of floats
% return Bd: nxj array of floats
% return Q: nxn array of floats
n = size(A, 1);
j = size(B, 2);

% Calculate Van Loan matrices
M = expm([-A G*D*G'; zeros(n, n) A']*Ts);
N = expm([A B; zeros(j, n) zeros(j, j)]*Ts);

% Extract sub matrices
M12 = M(1:n, n+1:n+n);
M22 = M(n+1:n+n, n+1:n+n);
N12 = N(1:n, n+1:n+j);

% Compute discretized system matrices
Ad = M22';
Bd = N12;
Qd = M22'*M12;
end

