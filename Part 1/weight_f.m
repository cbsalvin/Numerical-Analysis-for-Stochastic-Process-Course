function [weigh_ratio]=weight_f(cos_phi,alpha,step_alpha,Number_alpha)
% calcualte the weight for each sample by applying balance herusitic
want_al=1:(8/9):9;
D=0;
for i=1:Number_alpha
    %%% with given cos_phi arrary, calculate the sum of probability with
    %%% all biasing parameters
    D=D+(0.5^15)/lilelihood(cos_phi,want_al(i));
end
    %%% calculate the weight 
    weigh_ratio=(0.5^15)/lilelihood(cos_phi,alpha)/D;
end