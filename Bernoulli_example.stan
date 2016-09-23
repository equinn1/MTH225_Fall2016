//Estimate the probability of success in a Bernoulli distribution
//data {
//  int N;                        //sample size
//  int<lower=0,upper=1> y[N];   //y is Bernoulli
//  int<lower=0,upper=1> y;   //y is Bernoulli
//}
parameters {
  real<lower=0,upper=1> p;  //parameter is between 0 and 1
}
model {
  p ~ beta(1,1);            //beta(1,1) is a uniform prior (uninformative) 
//  y ~ bernoulli(p);       //Bernoulli likelihood
}
