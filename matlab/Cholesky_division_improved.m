clc, clear, close all

A = [4,-1,1;-1,2,-2;1,-2,3];
b = [5;-3;6];
x = cholesky_division(A,b);
disp(x);

function x=cholesky_division(A,b)
    [~,n] = size(A);
    L = diag(ones(1,n));
    D = ones(1,n);

    D(1) = A(1,1);
    L(2:n,1) = A(2:n,1) / D(1);
    for j = 2:n
        D(j) = A(j,j) - L(j,1:j-1)*(L(j,1:j-1).*D(1:j-1))';
        L(j+1:n,j) = ( A(j+1:n,j) -L(j+1:n,1:j-1)*(L(j,1:j-1).*D(1:j-1))') / D(j);
    end
    D = diag(D);
    y = L \ b;
    x = L' \ (D\y);
end
    