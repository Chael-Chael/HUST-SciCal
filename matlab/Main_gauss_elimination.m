clc, clear, close all

A=[1,2,3,4,5;-2,3,4,5,6;-3,-4,5,6,7;-4,-5,-6,7,8;-5,-6,-7,-8,9];
b=[55;66;63;36;-25];

x = gauss_elimination(A,b);
disp(x);

function x = gauss_elimination (A,b)
    zg = [A b];
    n = length(b);
    for k = 1:1:n-1 %k+1 elimination
        [~,max_row] = max(zg(k:n,k));
        max_row = max_row + k - 1;
        zg([k,max_row],:) = zg([max_row,k],:); %exchange
        for i = k+1:1:n
            zg(i,k:n+1) = zg(i,k:n+1) - ( zg(i,k) / zg(k,k) ) * zg(k,k:n+1);
        end
    end
    disp(zg);
    x = zeros(n,1);
    x(n) = zg(n,n+1) / zg(n,n);
    for i = n-1:-1:1
        x(i) = (zg(i, n+1) - zg(i,i+1:n) * x(i+1:n)) / zg(i,i);
    end
end