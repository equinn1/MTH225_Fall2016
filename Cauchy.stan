//Estimate the perameters of a Cauchy distribution
data {
  int N;                        //sample size
  real y[N];                    //y data values
}
parameters {
  real location;                //location parameter
  real<lower=0> scale;          //scale parameter
}
model {
  location ~ normal(0,100);     //normal prior for location
  scale    ~ cauchy(0,10);      //half-cauchy prior for scale 
  y ~ cauchy(location,scale);   //model Cauchy with parameters (location,scale)
}
