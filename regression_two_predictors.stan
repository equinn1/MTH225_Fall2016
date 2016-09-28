//Regression model with two predictors
data {
  int N;               //sample size
  real y[N];           //y data values
  real x1[N];          //x1 data values
  real x2[N];          //x2 data values
}
parameters {
  real beta[3];           //intercept and two 'slopes'
  real<lower=0> sigma;    //standard error
}
model {
  beta ~ normal(0,100);   //normal priors for intercept and slope
  sigma ~ cauchy(0,10);   //half-cauchy prior for sigma 

  for(i in 1:N) {
     y[i] ~ normal(beta[1]+beta[2]*x1[i]+beta[3]*x2[i],sigma);   
  }
}
