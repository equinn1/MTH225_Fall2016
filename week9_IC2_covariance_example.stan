//model file for week8: Single factor ANOVA with a covariate
data {
  int N;                  //sample1 size
  int cartruck[N];        //car or truck
  real weight[N];         //weight in thousands of pounds
  real mpg[N];            //gas mileage
}
parameters {
  real car;               //car 
  real truck;             //truck
  real beta[2];              //beta is the common slope of the parallel regression lines
  real<lower=0> sigma[2];    //common residual standard error
}
model {
  car ~ normal(0,5);        //normal priors for slope includes all reasonable mileage values
  truck ~ normal(0,5);      //slope will be very small with small standard deviation if weight is in pounds
  beta ~ normal(0,5);      //slope will be very small with small standard deviation if weight is in pounds
  sigma ~ cauchy(0,5);       //half-Cauchy prior for residual standard error
  
  for (i in 1:N)                   //loop through y values
    if (cartruck[i]==1)  
      mpg[i] ~ normal(50.0+car+beta[1]*weight[i],sigma[1]);
    else 
      mpg[i] ~ normal(50.0+truck+beta[2]*weight[i],sigma[2]);
}
