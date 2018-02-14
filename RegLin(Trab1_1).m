clear all
data = importdata('dadosICA1.mat');
data=sort(data);

x = data(:,1);
y = data(:,2);
n=length(x);
mx=mean(x); my=mean(y); Sxy=dot(x,y); Sx=sum(x); Sy=sum(y);
Sx2=sum(x.^2); S2x=Sx^2;
num=Sxy - Sx*Sy/n;
den=Sx2 - S2x/n;
B1h=num/den
B0h=my-B1h*mx;
B0h, B1h;

for i=1:n, 
yh(i)=B0h+B1h*x(i); 
end
yh=yh.';
residuos = y - yh;
Vnoiseh= sum(residuos.^2)/(n-2)
histfit(residuos);
residuos_norm=residuos/std(residuos);
H=kstest(residuos_norm)

SEQ=sum(residuos.^2);
ymed=mean(y); % Calcula potencia media
Syy=sum((y-ymed).^2); % Soma dos erros para modelo baseado na media
R2 = 1 - SEQ/Syy
S2=SEQ/(n-1);
%figure; cdfplot(residuos_norm); hold on
%z=randn(n,1); cdfplot(z); hold off

figure; 
plot(x,y,'r');  
hold on
plot(x,yh);
hold off








