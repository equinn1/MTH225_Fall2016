//Estimate the perameters of a normal distribution
data {
  int N;               //sample size
  real y[N];           //y data values
}
parameters {
  real mu;                //location parameter for normal
  real<lower=0> sigma;    //dispersion parameter (standard deviation)
}
model {
  mu ~ normal(0,100);     //normal prior for mu
  sigma ~ cauchy(0,5);    //half-cauchy prior for sigma 
  y ~ normal(mu,sigma);   //model normal with parameters (mu,sigma)
}
