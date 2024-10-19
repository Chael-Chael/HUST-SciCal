%%
%newton
clc, clear, close all
x0 = 0.5;
eps = 1e-8;

result = newton_fun(x0,eps);
%%
function value = fun(xi)
    syms x;
    f(x) = x + sin(x) - 1;
    value = subs(x - f(x) / diff(f(x)), x, xi); %迭代式构造
end


function result = newton_fun(x,eps)
    count = 0;

    while 1
         x_pre = x;
         x = fun(x);
         count = count + 1;
         result = fun(x);
         fprintf('round%2d: x_next = %f, x = %f, x_next - x = %.10f\n', count, x, x_pre, x-x_pre);
         if ( abs(x - x_pre) < eps )
            fprintf('precision reached\n');
            break;
         end
    end
end
