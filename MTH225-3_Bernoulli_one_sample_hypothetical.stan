//Compare parameter of Bernoulli distribution to hypothetical value
data {
  int N;                               //sample size
  real hval;                           //hypothetical value to compare
  int<lower=0,upper=1> recovered[N];   //data values - zeros and ones
}
parameters {
  real<lower=0,upper=1> p;             //parameter: probability of success
}
model {
  p ~ beta(1,1);                      //prior distribution for p: uniform
  for (i in 1:N) {
      recovered[i] ~ bernoulli(p);    //likelihood: Bernoulli distribution with parameter p
  } 
}
generated quantities{
  real diff;                          //declare a real variable for the p-hval difference
  int p_gt_hval;                      //declare an integer variable for binary - is p > hval 

  diff = p-hval;                      //compute the difference p-hval
  p_gt_hval=0;                        //set p_gt_hval=1 if p > hval, otherwise set it to zero
  if (p > hval) p_gt_hval=1;
}

