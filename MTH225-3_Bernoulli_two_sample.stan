//Estimate the perameter of a Bernoulli distibution
data {
  int N;                               //sample size
  int Nsite;                           //number of sites
  int<lower=0,upper=1> polio[N];       //data values - zeros and ones
  int<lower=1,upper=2> site[N];        //site index
}
parameters {
  real<lower=0,upper=1> p[Nsite];      //parameters for each site
}
model {
  p ~ beta(1,1);         //uniform prior for p
  for (i in 1:N) {
      polio[i] ~ bernoulli(p[site[i]]);
  } 
}
generated quantities{
  real diff;
  int two_gt_one;
  for (i in 1:N) {
    diff = p[2]-p[1]; 
    two_gt_one=0;
    if (p[2] > p[1]) two_gt_one=1;
  }
}

