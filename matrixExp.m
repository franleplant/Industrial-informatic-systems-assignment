%
% A: target matrix
% X0: initial conditions vector
% n: t max range number 
% dt: delta t (time)
% N: exponential matrix expression number
%

function P = matrixExp(A, X0, dt, n, N)
    syms t;

    P = [];

    M = matrixExpExpression(A, N) * X0;

    for ti = 0:dt:n 
        P = [P, subs(M, t, ti)];
    end
        
