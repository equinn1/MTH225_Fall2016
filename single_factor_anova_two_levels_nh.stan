//single-factor ANOVA with two levels and possibly different standard errors at each level
data {
  int N;                                //sample1 size
  real y[N];                            //y values
  int<lower=1,upper=2> level[N];        //level for this observation (integer 1 or 2)
}
parameters {
  real alpha[2];                //Parameters for each level of the single factor
  real<lower=0> sigma_e[2];     //error standard deviations - one for each level
}
model {
  int j;
  alpha ~ normal(0,20);        //normal priors for each alpha level 
  sigma ~ cauchy(0,10);         //half-cauchy prior for error standard deviation 
  
  for (i in 1:N){                   //loop through y values
    y[i] ~ normal(alpha[level[i]],sigma_e[j]);  //y[j] has normal likelihood with mean alpha[j] and std deviation sigma[j]
  }
}
generated quantities {
  real d12;
  
  d12<-alpha[1]-alpha[2];    //sample difference between alpha1 and alpha2
}
