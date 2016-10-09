//model file for week1 parameter estimation exercise
data {
  int N1;              //sample1 size - level 1
  int N2;              //sample2 size - level 2
  real Y11[N1];        //Y values - Factor 1 Level 1
  real Y12[N2];        //Y values - Factor 1 Level 2
}
parameters {
  real mu1;                  //location parameter for sample 1
  real mu2;                  //location parameter for sample 2
  real<lower=0> sigma1;      //standard deviation sample 1
  real<lower=0> sigma2;      //standard deviation sample 2
}
model {
  mu1 ~ normal(0,100);       //normal prior for mu1
  mu2 ~ normal(0,100);       //normal prior for mu2
  sigma1 ~ cauchy(0,50);     //half-cauchy prior for standard deviation 1 
  sigma2 ~ cauchy(0,50);     //half-cauchy prior for standard deviation 2
  
  Y11 ~ normal(mu1,sigma1);      //process data
  Y12 ~ normal(mu2,sigma2);      
}
generated quantities {
  real diff;
  real diff_sigma;
  
  diff = mu1-mu2;
  diff_sigma = sigma1-sigma2;
}
