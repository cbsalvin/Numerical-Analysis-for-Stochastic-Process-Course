clear all;
%%% generate the basic parameters for the test
step=15;
delta_r=1;%%% set the delta_r as bin width
N=step/delta_r;%%% calculate the total amount of bins
Pro=zeros(N,1); %%% set the record matrix for bins
sample=500000;%%% for each alpha, generate the number of samples.
step_alpha=0.1;%%% set up the step add for each loop of alpha
alpha=1:(8/9):9;%%% the range of alpha
Number_alpha=length(alpha);%% total number of alpha

% initial the test%
for counter=1:N
    up_range=counter*delta_r; %%% upper radius for the bin
    low_range=(counter-1)*delta_r;%% lower radius for the bin
    for f=1:Number_alpha%%% select different alpha
         P(f)=0;%%% record each sample's probobality for multiple MC
            for k=1:sample
            %%% make 15 steps
            theta=2*pi*rand(step,1);
            cos_phi=2*rand(step,1).^(1/alpha(f))-1;
            sin_phi=sqrt(1-cos_phi.^2);
            x=cos(theta).*sin_phi;
            y=sin(theta).*sin_phi;
            z=cos_phi;
            %%% 15 steps finished;
            radius=sqrt(sum(x)^2+sum(y)^2+sum(z)^2);%%% find the radius for each samples
            likeli=lilelihood(cos_phi,alpha(f));%%% get the likelihood ratio for each sample
            weight=weight_f(cos_phi,alpha(f),step_alpha,Number_alpha);%%% using balance herusitic to get weight of each sample
                if radius<up_range && radius>low_range%%% find if each sample in the bin or not
                    I=1;%%% I is the indicator
                else
                    I=0;
                end
                P(f)=P(f)+I*weight*likeli;%%% all the probobility up for multiple MC
            end
          P(f)=P(f)/sample;
    end
    Pro(counter)=sum(P)/delta_r;%%% get the probability for each bin
 %%% Generate the figure to show that first step is random walk
end
figure (1);
hori=[1:N]*delta_r;
plot(hori-0.5,log(Pro));
hold on;

%%%%% The checking one      %%%%%%%%%%%%%%
r2=linspace(0,15);
Rho=r2/15;
for k=1:length(r2)
    rho=Rho(k);
    syms x
    L_x=1/tanh(x)-1/x==rho;
    inv_L=solve(L_x,x);
    A=(pi/2/15^3*(1-rho^2-2*rho/inv_L))^0.5;
    B=exp(-15*rho*inv_L);
    C=(sinh(inv_L)/inv_L)^15;
    Pr(k)=rho*inv_L/15/A*B*C;   
end

plot(r2,log(Pr),'r:');

