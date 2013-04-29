%This is a gradient descent for Figure 9.3
function [seq, len] = fyc()
[seq, len] = graddescbt('fd', 'dfd', [1 1], 0.1, 0.01, 0.1, 0.7)
[X,Y] = meshgrid(-0.8:0.01:0.2,-0.2:0.01:0.2);
Z = exp(X+3.*Y-0.1)+exp(X-3.*Y-0.1)+exp(-X-0.1);
figure
contour(X, Y, Z, 10)
hold on;
plot(0, 0, 'o')
end

function [seq, len] = graddescbt(f, g, x, e, t, alpha, beta)
% gradient descent
% f -- function
% g -- gradient
% x -- initial guess
% e -- initial step size
% t -- tolerance
gx = feval(g,x) ;
seq = zeros(1000, 2);
len = 1;
seq(len, :) = x;
while(norm(gx)>t)  % crude termination condition  norm is 2-norm
  step = e .* alpha;
  while(feval(f,x - step .* feval(g,x)) > feval(f,x - step .* feval(g,x) .* beta))
      step = step .* beta;
  end
  x = x - step .* feval(g,x) ;
  len = len + 1;
  seq(len, :) = x;
  gx = feval(g,x); 
end
end

function rtn= fd(c)
x=c(1) ;
y=c(2) ;
rtn = exp(x+3.*y-0.1)+exp(x-3.*y-0.1)+exp(-x-0.1) ;
end

function rtn= dfd(c)
x=c(1) ;
y=c(2) ;
rtn = [exp(x+3.*y-0.1)+exp(x-3.*y-0.1)-exp(-x-0.1) 3.*exp(x+3.*y-0.1)-3.*exp(x-3.*y-0.1)] ;
end
