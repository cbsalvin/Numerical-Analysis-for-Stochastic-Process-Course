function [rate]=lilelihood(X,alpha)
% this function to find each sample's likelihood ratio
for i=1:15
    %%% calcualte every element in cos_phi's likelihood ratio
    rate(i)=1/(alpha*((X(i)+1)/2)^(alpha-1));
end
rate=prod(rate);%%% product them together.
end