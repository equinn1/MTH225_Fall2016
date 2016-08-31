//Estimate the probability of success in a Binomial distribution
data {
  int N;                        //sample size
  int<lower=0,upper=10> y[N];   //y is binomial 10
}
parameters {
  real<lower=0,upper=1> p;  //parameter is between 0 and 1
}
model {
  p ~ beta(1,1);            //beta(1,1) is a uniform prior (uninformative) 
  y ~ binomial(10,p);       //Bernoulli likelihood
}
