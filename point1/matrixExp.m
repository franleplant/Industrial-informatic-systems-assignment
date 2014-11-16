%
% A: target matrix
% X0: initial conditions vector
% dt: delta t (time)
% X_MAX_RANGE: t max range number 
% N_MAX_EXP_TERMS: exponential matrix expression number
%

function P = matrixExp(A, X0, dt, X_MAX_RANGE, N_MAX_EXP_TERMS)
    syms t;


    % Calculate the simbolic expression of the truncated
    % infinite exponential matrix
    M = eye(2);
    for n = 1:N_MAX_EXP_TERMS
        M = M + A^n * t^n / factorial(n);
    end


    P = [];
    for ti = 0:dt:X_MAX_RANGE 
        P = [P, subs(M, t, ti) * X0];
    end
        
