//Estimate the perameter of a Bernoulli distibution
data {
  int N;                               //sample size
  int<lower=0,upper=1> y[N];           //y data values - zeros and ones
}
parameters {
  real<lower=0> p;       //parameter for probability of success
}
model {
  p ~ beta(1,1);         //uniform prior for p
  y ~ bernoulli(p);   //model normal with parameters (mu,sigma)
}

