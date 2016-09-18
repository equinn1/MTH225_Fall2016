//Compare parameter of Bernoulli distribution to hypothetical value
data {
  int N;                               //sample size
  real hval;                           //hypothetical value to compare
  int<lower=0,upper=1> recovered[N];   //data values - zeros and ones
}
parameters {
  real<lower=0,upper=1> p;      //parameter
}
model {
  p ~ beta(1,1);         //uniform prior for p
  for (i in 1:N) {
      recovered[i] ~ bernoulli(p);
  } 
}
generated quantities{
  real diff;
  int gt_hval;
  for (i in 1:N) {
    diff = p-hval; 
    gt_hval=0;
    if (diff > 0) gt_hval=1;
  }
}

