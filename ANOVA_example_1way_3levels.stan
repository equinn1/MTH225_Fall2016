//single-factor ANOVA 
data {
  int N;                  //sample size - all levels
  int L;                  //number of levels
  real y[N];              //y values
  int lvl[N];             //level for this observation
}
parameters {
  real alpha[L];          //Parameters for each level of the single factor
  real<lower=0> sigma_e;  //common error standard deviation for all levels
}
model {
  
  alpha ~ normal(0,20);        //normal priors for each alpha level
  sigma_e ~ cauchy(0,10);      //half-cauchy prior for error standard deviation 
  
  for (i in 1:N){                   //loop through y values
    y[i] ~ normal(alpha[lvl[i]],sigma_e);  //y[j] ~ normal(alpha[grp],sigma_e)
  }
}
generated quantities {
  real d12;
  real d13;
  real d23;
  
  d12 = alpha[1]-alpha[2];    //sample difference between alpha1 and alpha2
  d13 = alpha[1]-alpha[3];    //sample difference between alpha1 and alpha3
  d23 = alpha[2]-alpha[3];    //sample difference between alpha2 and alpha3
}
