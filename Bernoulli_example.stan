//Estimate the probability of success in a Bernoulli distribution
data {
  int N;                       //sample size
  int N_start;                 //first element to use
  int N_end;                   //last element to use
  int N_ones;
  int N_zeros;
  int<lower=0,upper=1> y[N];   //y is Bernoulli
}
parameters {
  real<lower=0,upper=1> p;  //parameter is between 0 and 1
}
model {
  p ~ beta(1+N_ones,1+N_zeros);   //beta(1,1) is a uniform prior (uninformative)
  for (i in N_start:N_end){
  y[i] ~ bernoulli(p);       //Bernoulli likelihood
  }
}
generated quantities{
  int p_gt_015;
  p_gt_015 = 0;
  if (p > 0.15) p_gt_015 = 1;
}
