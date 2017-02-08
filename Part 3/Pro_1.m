clear;
%%% Initial the condition
mu=0.05;
vol=0.2;
T=2.0;
K=1000;
sample=100000;%%% number of samples
s0=1000;
dt=0.01;%%% timestep
Timestep=T/dt;
trail=500;%%% number of C I want to get
C=zeros(trail,1);
%%% Ito calculas
for i=1:trail
    s=s0*ones(sample,1);
    dw=normrnd(0,sqrt(dt),[sample Timestep]);
     for j=1:Timestep
            ds=mu*s.*dt+vol*s.*dw(:,j);
            s=s+ds;
     end
    C(i)=mean((exp(-mu*T)*max((s-K),0)));
end
Final_C=mean(C);
% want_variance=var(C);
[h,p,ci,stats] = ttest(C);
interval=ci(2)-ci(1);
if interval<1
    disp('the result are within $1 interval at a significance level of 0.05');
else
    disp('the result are NOT within $1 interval at a significance level of 0.05'); 
end
%%% histogram s
low_s=floor(min(s));
upper_s=round(max(s));
range=low_s:20:upper_s;
hist(s,range);
