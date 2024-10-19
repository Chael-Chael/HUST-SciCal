clc, clear, close all

A = [1,2,3;2,5,2;3,1,5];
b = [14;18;20];
x = lu_division(A,b);
disp(x);

function x = lu_division(A,b)
    [~,n] = size(A);
    L = diag(ones(1,n));
    U = zeros(5,5);
    
        U(1,1:n) = A(1,1:n);
        L(2:n) = A(2:n,1)/U(1,1);
        
    for k = 1:n
        U(k,k:n) = A(k,k:n) - L(k,1:k-1) * U(1:k-1,k:n);
        L(k+1:n,k) = (A(k+1:n,k) - L(k+1:n,1:k-1) * U(1:k-1,k)) / U(k,k);
    end 
    
%     y = zeros(n,1);
%     x = zeros(n,1);
%     
%     y(1) = b(1);
%     for i = 2:n
%         y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
%     end 
%     x(n) = y(n) / U(n,n);
%     for i = n-1:-1:1
%         x(i) = ( y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
%     end
    y = ;
    x = y \ U;
end
        
