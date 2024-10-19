clc, clear, close all
function y = lagrange(x0,y0,x)
n = length(x0);
m = length(x);
s = 0.0;

for i = 1:m
    for k = 1:n
        p = 1.0;
        for j = 1:n
            if j ~= k
                p = p * (x(i)- x0(j)) / (x0(k) - x0(j));
            end
        end
        s = s + p*y0(k);
    end
    y(i) = s;
end
end

function y = newton(x0,y0,x)
n = length(x0);

%计算一阶差商
for i = 1:n-1
    d(i,1) = (y0(i+1) - y0(i)) / (x0(i+1) - x0(i));
end

%计算2~n-1阶差商
for j = 2:n-1 %阶数
    for k = 1:n-j
        d(k,j) = (d(k+1,j-1) - d(k,j-1)) / (x0(k+j) - x0(k));
    end
end

%提取对角线差商
a(1) = y0(1);
for k = 2:n
    a(k) = d(1,k-1);
end
%计算插值
b(1) = 1;
c(1) = a(1);
for j = 2:n
    b(j) = (x-x0(j-1)) * b(j-1);
    c(j) = a(j) * b(j);
end

y = sum(c);
end

function y = fun1(x)
   for i = 1:length(x)
        y(i) = x(i) * exp(x(i)) * (1 + exp(x(i)));
    end
end

function y = fun2(x)
    for i = 1:length(x)
        y(i) = sinh(x(i));
    end
end

x1 = [1.00, 1.02, 1.04, 1.06];
y1 = fun1(x1);
yl = lagrange(x1,y1,1.03);
fprintf('%.7f\n',yl);
disp(yl - fun1(1.03));

x2 = [0.40, 0.55, 0.70, 0.85, 1.00];
y2 = fun2(x2);
yn = newton(x2,y2,0.596);
fprintf('%.7f\n',yn);
disp(yn - fun2(0.596));