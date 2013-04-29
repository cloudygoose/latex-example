function soln = graddesc(f, g, i,e, t)
% gradient descent
% f -- function
% g -- gradient
% i -- initial guess
% e -- step size
% t -- tolerance
gi = feval(g,i) ;
while(norm(gi)>t)  % crude termination condition
  i = i - e .* feval(g,i) ;
 gi = feval(g,i) 
end
soln = i ;

