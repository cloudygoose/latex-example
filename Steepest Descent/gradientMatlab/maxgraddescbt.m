function soln = maxgraddescbt(f, g, i, e, t, alpha, beta)
% gradient descent
% f -- function
% g -- gradient
% i -- initial guess
% e -- initial step size
% t -- tolerance
gi = feval(g,i) ;
while(norm(gi)>t)  % crude termination condition
  step = e .* alpha;
  while(feval(f,i + step .* feval(g,i)) < feval(f,i + step .* feval(g,i) .* beta))
      step = step .* beta;
  end
  i = i + step .* feval(g,i) ;
  i
 gi = feval(g,i) 
end
soln = i ;