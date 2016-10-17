//Multiple regression example
data {
  int N;                   //sample size
  real mpg[N];             //miles per gallon
  real wt[N];              //vehicle weight (in thousands of pounds)
  real hp[N];              //engine horseposer (in hundreds)
  real axle[N];            //axle ratio
}
parameters {
  real intcp;              //intercept
  real beta_wt;            //beta coefficient for weight
  real beta_hp;            //beta coefficient for horsepower
  real beta_axle;          //beta coefficient for axle ratio
  real <lower=0> sigma;    //error term
}
model {
  beta_wt ~ normal(0,20);  //normal priors for beta values
  beta_hp ~ normal(0,20);
  beta_axle ~ normal(0,20);
  sigma ~ cauchy(0,10);    //cauchy prior for error term  
  
  for (i in 1:N){
     mpg[i] ~ normal(intcp+beta_wt*wt[i]+beta_hp*hp[i]+beta_axle*axle[i],sigma); 
  }
}
