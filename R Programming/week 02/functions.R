add2 <- function(x,y){
   x + y 
}

above10 <- function(x){
  x[x>10]
}

above <- function(x,n){
  x[x>n]
}

columnmean <- function(y, removeNA =TRUE){
  nc <- ncol(y) ;
  means <- numeric(nc);
  for(i in 1:nc) means[i] <- mean(y[,i],na.rm = removeNA);
  return(means)
}

make.power <- function(n){
  pow <- function(x){
    return(x^n) ;
  }
  return(pow)
}

cube <- make.power(3); square <- make.power(2)

# Identifier l'environnement d'une fonction
ls(environment(cube))

# Obtenier une valeur d'un environnement particulier
get("n",environment(cube)) 

# assign permet d'affecter une valeur à une environnement en particulier
# supposer que l'on veut changer la valeur n=3 de cube en n=2
assign("n",2,environment(cube))

# Lexical vs. Dynamic Scoping
# Lexical scoping : les valeurs des variables non-déclarées sont recherchées dans
# l'environnement de définition de la fonction
# Dynamic Scoping : les valeurs des variables non-déclarées sont recherchées dans
# l'environnement de la fonction appelante.. (environement parent)
y <- 10 ;

f <- function(x){
  y <- 2;
  return(y^2+g(x)); # ici dynamic scoping for x
}

g <- function(x){
  return(x*y); #lexical scoping for y
}

f(3)

# Programmation linéaire (??)
make.NegLogLik <- function(data,fixed=c(FALSE,FALSE)){
  params <- fixed ;
  function(p){
    params[!fixed] <- p;
    mu <- params[1];
    sigma <- params[2];
    a <- -.5*length(data)*log(2*pi*sigma^2);
    b <- -.5*sum((data-mu)^2)/(sigma^2);
    return(-(a+b));
  }
}

set.seed(1); normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals);
ls(environment(nLL))

# Aucun des paramètre m'est fixé
optim(c(mu=0,sigma=1),nLL)$par

# Sigma est fixé à 2
nLL <- make.NegLogLik(normals,c(FALSE,2))
optimize(nLL,c(-1,3))$minimum

# mu est fixé à 1
nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum

# Fixing sigma=2