clc, clear, close all

function x = jacobi_fun(A, b, dim, x0, tol, iter)
    x = zeros(dim, 1);
    L = tril(A, -1);
    D = diag(diag(A));
    U = triu(A, 1);
    count = 0;
    
    while 1
        x = D \ (-(L + U) * x0 + b); % 迭代更新
        %x = x0 - 1.5 * D \ (A * x0 - b);
        count = count + 1;
        % 显示迭代信息
        disp(['迭代次数 = ', num2str(count)]);
        disp('当前解向量 x = ');
        %disp(x);
        fprintf('%.6f\n',x);
        disp('||x - x0|| = ');
        disp(norm(x - x0, Inf));
        
        % 判断收敛性
        if norm(x - x0, Inf) < tol
            disp('达到精度要求，迭代结束');
            break;
        end
        if count == iter
           disp('达最大迭代次数，迭代结束');
           break;
        end
            x0 = x;
    end
end

function x = gauss_seidel_fun(A, b, dim, x0, tol, iter)
    x = zeros(dim, 1);
    L = tril(A, -1);
    D = diag(diag(A));
    U = triu(A, 1);
    count = 0;
    
    while 1
       x = (D + L) \ (-U * x0 + b); % 迭代更新
       count = count + 1;
       % 显示迭代信息
       disp(['迭代次数 = ', num2str(count)]);
       disp('当前解向量 x = ');
       %disp(x);
       fprintf('%.6f\n',x);
       disp('||x - x0|| = ');
       disp(norm(x - x0, Inf));
       
       % 判断收敛性
       if norm(x - x0, Inf) < tol
           disp('达到精度要求，迭代结束');
           break;
       end
       if count == iter
           disp('达最大迭代次数，迭代结束');
           break;
        end
           x0 = x;
    end
end
%% 主程序
% 定义方程组
A = [-3, 1, 1, 1, 1;
    -1, -7, 1, 1, 1;
    -1, -1, -11, 1, 1;
    -1, -1, -1, -15, 1;
    -3, -2, -1, 0, 19];
b = [11; -3; -27; -61; 85];

% 未知量维度
dim = 5;
% 初始值
x0 = zeros(dim, 1);
% 精度上限
tol = 1e-5;
%迭代最大
iter = 100;
%%
% Jacobi迭代
disp('Jacobi迭代法:');
x_jacobi = jacobi_fun(A, b, dim, x0, tol, iter);

% Gauss-Seidel迭代
disp('Gauss-Seidel迭代法:');
x_gauss_seidel = gauss_seidel_fun(A, b, dim, x0, tol, iter);
