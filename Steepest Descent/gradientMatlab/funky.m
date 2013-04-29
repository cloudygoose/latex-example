function rtn = funky(x,y) ;
rtn = sin(sqrt(x.^2 + y.^2))./(x.^2 + y.^2 + .00001) ; 
