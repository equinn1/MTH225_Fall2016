//Compare parameter of Bernoulli distribution to hypothetical value
data {
  int N;                               //sample size
  real hval;                           //hypothetical value to compare
  vector[N] y;                         //data vector
}
parameters {
  real mu;                             //parameter: mean
  real<lower=0> sigma;                 //parameter: standard deviation
}
model {
  mu ~ normal(0,200);                  //prior distribution for mu - normal
  sigma ~ cauchy(0,10);                //prior for sigma - half-cauchy
  
  y ~ normal(mu,sigma);                //likelihood: normal distribution with mean mu and sd sigma
}
generated quantities {
  real diff;                           //difference between mu and hypothetical value
  int mu_gt_hval;
  diff = mu - hval;                    //compute the difference
  mu_gt_hval = mu > hval ? 1 : 0;      //indicator variable : 1 if mu>hval, 0 otherwise
}


