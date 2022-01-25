clear; clc; close all;

%% function --- 
vv = 0;
n = 1;
[E1,E2,G12,v12,t,f,theta] = eparam(n,vv);
[E12,E22,G122,v122,t2,f2,theta] = eparam(n,vv);

n = 91;
theta = 0:1:90;
for i = 1:n
    E1(i) = E1(1);
    E2(i) = E2(1);
    G12(i) = G12(1);
    v12(i) = v12(1);
    t(i) = t(1);
    f(i) = f(1);
end
for i = 1:n
    E12(i) = E12(1);
    E22(i) = E22(1);
    G122(i) = G122(1);
    v122(i) = v122(1);
    t2(i) = t2(1);
    f2(i) = f2(1);
end

[Q,Qbar,S] = Qcalc(n,E1,E2,G12,v12,theta);
[Q2,Qbar2,S2] = Qcalc(n,E12,E22,G122,v122,theta);

%%
qb = zeros(1,n);
for i =1:n
    qb(i) = Qbar(1,1,i)/1e9;
end

qb2 = zeros(1,n);
for i =1:n
    qb2(i) = Qbar2(1,1,i)/1e9;
end

%'AS/3501 carbon/epoxy'
%'E-glass/470-36/vinyl ester'
plot(theta,qb,theta,qb2,'LineWidth',2)
hold on 
legend('AS/3501 carbon/epoxy','E-glass/470-36/vinyl ester')
xlabel '\theta'
ylabel 'Qbar (1,1) GPa'
