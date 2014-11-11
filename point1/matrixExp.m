%
% A: target matrix
% X0: initial conditions vector
% X_MAX_RANGE: t max range number 
% dt: delta t (time)
% N: exponential matrix expression number
%

function P = matrixExp(A, X0, dt, X_MAX_RANGE, N)
    syms t;

    P = [];

    M = matrixExpExpression(A, N);

    for ti = 0:dt:X_MAX_RANGE 
        P = [P, subs(M, t, ti) * X0];
    end
        
