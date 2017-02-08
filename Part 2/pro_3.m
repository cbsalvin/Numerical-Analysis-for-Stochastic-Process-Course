clear all;
N=1000000;
alpha=3/N;
beta=1;
gama=0.1;
Try=10000;
S(1)=N*0.9;
I(1)=N*0.1;
R(1)=0;
t(1)=0;
tao=0.1;
sto=[-1 0 1;1 -1 0;0 1 -1];
for i=1:Try
    v=[alpha*S(i)*I(i),beta*I(i),gama*R(i)];
    normarv=(poissrnd(v*tao))';
    x=sto*normarv;
    t(i+1)=t(i)+tao;
    S(i+1)=S(i)+x(1);
    I(i+1)=I(i)+x(2);
    R(i+1)=R(i)+x(3);
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
figure (1);
plot(t,rel_s);
hold on;
plot(t,rel_i);
hold on;
plot(t,rel_r);
hold on;
figure (2);
plot(rel_s,rel_i);