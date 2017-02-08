clear all;
N=100000;
alpha=3/N;
beta=1;
gama=0.1;
Try=1000000;
S(1)=N*0.9;
I(1)=N*0.1;
R(1)=0;
t(1)=0;
sto=[-1 0 1;1 -1 0;0 1 -1];
for i=1:Try
    v=[alpha*S(i)*I(i),beta*I(i),gama*R(i)];
    if (sum(v)==0)
        break;
    end
    x=[S(i),I(i),R(i)]';
    u1=rand();
    u2=rand();
    tao=-log(u1)/sum(v);
    normarv=v/sum(v);
    j=min(find(cumsum(normarv)>=u2));
    x=x+sto(:,j);
    t(i+1)=t(i)+tao;
    S(i+1)=x(1);
    I(i+1)=x(2);
    R(i+1)=x(3);
    if (S(i+1)<0)||(I(i+1)<0)||(R(i+1)<0)
        S(i+1)=S(i);
        I(i+1)=I(i);
        R(i+1)=R(i); 
        break;
    end
end
rel_s=S./N;
rel_i=I./N;
rel_r=R./N;
limt_s=1/3*ones(1,length(rel_s));
limt_r=2/3.3*ones(1,length(rel_s));
limt_i=2/33*ones(1,length(rel_s));
figure (1);
plot(t,rel_s);
hold on;
plot(t,rel_i);
hold on;
plot(t,rel_r);
hold on;
% plot(t,limt_s);
% hold on;
% plot(t,limt_r);
% hold on;
% plot(t,limt_i);
% hold on;

figure (2);
plot(rel_s,rel_i);