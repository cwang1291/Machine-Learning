
% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 3: Support Vector Machine with Newton's Method
%
% TASK 2: Write a routine that implements Newton's Method 
% 			 to solve dual-form support vector machine.
% ============================================================ 
% INPUT   K: the kernel matrix;
%			 C: a column vector that contains the upper bounds; 
%         params: 
%				params.epsilon: the solution accuracy;
% 				params.maxiter: the maximum number of iterations;
%           params.barrier: the multiplicative factor. 
% ============================================================ 
% OUTPUT  alpha: a column vector that contains the optimal coefficients. 
function alpha = svm(K, C, params)
u=1000*mean(diag(K));
alpha=C/2;

for i=1:params.maxiter
    g=K*alpha-1-u*(1./alpha)+u*(1./(C-alpha));
    H=K+diag(u./(alpha.^2))+diag(u./((C-alpha).^2));
    d=-H\g;
    t=1;
    while func(alpha+t*d,K,C,u)>func(alpha,K,C,u)+0.5*t*g'*d
        t=t*0.667;
    end
    if t>0.99 && u>params.epsilon
        u=u*params.barrier;
    end
    alpha=alpha+t*d;
    if u<=params.epsilon && norm(d)<=params.epsilon
        break;
    end
end
end



function value = func(a,K,C,u)
    value=0.5*a'*K*a-sum(a)-u*sum(log(a)+log(C-a));
    for i=1:size(a,1)
        if a(i)>C(i) || a(i)<0
            value=inf;
            break;
        end
    end
end


%%
