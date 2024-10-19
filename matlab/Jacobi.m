clc,clear,close all

A = [-3, 1, 1, 1, 1;
    -1, -7, 1, 1, 1;
    -1, -1, -11, 1, 1;
    -1, -1, -1, -15, 1;
    -3, -2, -1, 0, 19];
b = [11, -3, -27, -61, 85]';
x0 = [0,0,0,0,0]';
tol = 1e-5;
iter = 300;

x = jacobi(A, b, x0, tol ,iter);

function x = jacobi(A, b, x0, tol ,iter)
    dim = length(b);
    x = zeros(dim,1);
    L = tril(A,-1);
    D = diag(diag(A));
    U = triu(A,1);
    count = 0;
    
    while 1
        x = D \ (-(L+U) * x0 + b);
        count = count + 1;
        fprintf('iterations = %d\n', count);
        disp('current vector = '); 
        disp(x);
        disp('||x-x0|| = ');
        disp(norm(x-x0,Inf));
        
        if norm(x-x0,Inf) < tol
            disp('precision reached');
            break;
        end
        if count == iter
            disp('max iteration reached');
            break;
        end
        
        x0 = x;
    end
end