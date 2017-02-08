sample=1000;
x=zeros(sample,1);
y=zeros(sample,1);
z=zeros(sample,1);
for i=1:sample
	theta=rand()*2*pi;
	cos_phi=unifrnd(-1,1);
	phi=acos(cos_phi);
	x(i)=cos(theta)*sin(phi);
	y(i)=sin(theta)*sin(phi);
	z(i)=cos_phi;
end
scatter3(x,y,z);