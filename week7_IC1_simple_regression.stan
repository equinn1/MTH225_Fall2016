//model file for week7 in-class exercise 1: simple regression
data {
  int N;                  //sample1 size
  real weight[N];         //x values - vehicle weight
  real mpg[N];            //y values - EPA gas mileage
}
parameters {
  real icpt;              //2 Parameters - slope and intercept
  real slope;
  real<lower=0> sigma;    //residual standard error
}
model {
  icpt ~ normal(30,20);        //normal priors for slope includes all reasonable mileage values
  slope ~ normal(0,0.2);       //slope will be very small with small standard deviation if weight is in pounds
  sigma ~ cauchy(0,5);         //half-Cauchy prior for residual standard error
  
  for (i in 1:N){                   //loop through y values
    mpg[i] ~ normal(icpt+slope*weight[i],sigma); 
  }
}
