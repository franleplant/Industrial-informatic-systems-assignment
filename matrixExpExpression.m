function M = matrixExpExpression(A, N)
    syms t;
    M = eye(2);
    for n = 1:N
        M = M + A^n * t^n / factorial(n);
    end

