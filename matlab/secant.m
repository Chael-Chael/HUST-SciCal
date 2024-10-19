%%
%secant
clc, clear, close all
x0 = 0.5;
x1 = 0.6;
eps = 1e-8;

result_secant = secant_fun(x0, x1, eps);

function result = secant_fun(x_low, x_high, eps)
    count = 0;
    while 1
        x = x_high; %k
        x_high = x - (x - x_low) / ( fun(x) - fun(x_low) ) * fun(x); %k+1
        x_low = x; %k-1
        count = count + 1;
        fprintf('round%2d: x_next = %f, x = %f, x_next - x = %.10f\n', count, x_high, x, x_high-x);
        result = fun(x_high);
        if ( abs(x_high - x) < eps )
            fprintf('precision reached\n');
            break;
        end
    end
end
function value = fun(x)
    %value = ( (cos(0.5) * x - sin(x) + 1.0) / (1.0 + cos(0.5)) );
    value = x + sin(x) - 1;
end
    

