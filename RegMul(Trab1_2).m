clear all
% carrega arquivo de dados
clc
data = importdata('bodyfatData.txt');
%
data(:,1)=[];
y=data(:,1); 
X=data(:,2:end);
%data normalizada
n=length(X(1,:));
for i=1:n, 
    mini=min(X(:,i));
    maxi=max(X(:,i));
    X(:,i)=(X(:,i)-mini)/(maxi-mini);
end

for i=1:13,
    x=X;
    x(:,i)=[];    
    lm = LinearModel.fit(x,y,'linear');
    TermoExcluido=i
    Rsquared =lm.Rsquared
end
%histfit(lm.Residuals.raw);
%boxplot(lm.Residuals.raw);