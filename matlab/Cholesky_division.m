clc, clear, close all

A = [4,-1,1;-1,2,-2;1,-2,3];
b = [5;-3;6];
x = cholesky_division(A,b);
disp(x);

function x=cholesky_division(A,b)
    [~,n] = size(A);
    L = zeros(n,n);
    
    for j = 1:n
        L(j,j) = ( A(j,j) - sum( L(j,1:j-1).^2 ))^0.5;
        L(j+1:n,j) = ( A(j+1:n,j) - L(j+1:n,1:j-1) * L(j,1:j-1)') / L(j,j);
    end
    
    y = L \ b;
    x = L' \ y;
end
    