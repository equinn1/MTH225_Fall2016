//Estimate the parameter of an exponential distribution
data {
  int N;                        //sample size
  real<lower=0> y[N];           //y consists of N reals, constrained to be nonnegative by <lower=0> 
}
parameters {
  real<lower=0> theta;          //parameter theta constrained to be nonnegative by <lower=0>
}
model {
  theta ~ normal(0,100);        //half-normal prior: top half of bell curve centered at zero with sd 100 
  y ~ exponential(theta);       //exponential likelihood given parameter theta
}
