clc, clear, close all

A = [2,-1,0,0,0;
    -1,2,-1,0,0;
    0,-1,2,-1,0;
    0,0,-1,2,-1;
    0,0,0,-1,2];
b = [1;0;0;0;0];
x = cholesky_division(A,b);
disp(x);

function x=cholesky_division(A,b)
    [~,n] = size(A);
    L = diag(ones(1,n));
    U = zeros(n,n);

    U(1,1) = A(1,1);
    U(1,2) = A(1,2);
    for i = 2:n
        U(i-1,i) = A(i-1,i);
        L(i,i-1) = A(i,i-1) / U(i-1,i-1);
        U(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
    end

    y = L \ b;
    x = U \ y;
end
    