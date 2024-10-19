clc, clear, close all

A=[1,2,3,4,5;-2,3,4,5,6;-3,-4,5,6,7;-4,-5,-6,7,8;-5,-6,-7,-8,9];
b=[55;66;63;36;-25];

x = gauss_elimination(A,b);
disp(x);

function x = gauss_elimination (A,b)
    zg = [A b];
    n = length(b);
    for k = 1:1:n-1 %k+1 elimination
        for m = k+1:1:n
            zg(m,k:n+1) = zg(m,k:n+1) - ( zg(m,k) / zg(k,k) ) * zg(k,k:n+1);
        end
    end
    disp(zg);
    x = zeros(n,1);
    x(n) = zg(n,n+1) / zg(n,n);
    for m = n-1:-1:1
        x(m) = (zg(m, n+1) - zg(m,m+1:n) * x(m+1:n)) / zg(m,m);
    end
end