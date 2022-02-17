
clear; clc; close all;
% temp file for testing

%% function [SLP,SLM,STP,STM] = sparam(vv,com,fib,mat,n,f,E1,E2,v12)
% -------------------------------------------
SLP = zeros(1,n);
SLM = zeros(1,n);
STP = zeros(1,n);
STM = zeros(1,n);

% Fiber strength properties (GPa)
NameF = {'Boron','HMS','AS','T300','KEV','S-G','E-G'};
SLpf = [4.140 1.720 2.410 2.410 2.760 4.140 2.760];
SLmf = [4.830 1.380 1.790 2.070 0.517 0 0];
ef1 = [0.008 0.007 0.018 0.014 0.024 0.057 0.048];
Ef2 = [400 6.21 13.8 13.8 4.14 85.5 73.1];
fd = [1.4224e-5 7.62e-06 7.62e-06 7.62e-06 1.17e-05 9.14e-06 9.14e-06];

% Matrix strength properties (GPa)
NameM = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
Sp = [0.055 0.048 0.1034 0.138 0.103 0.379];
Sm = [0.103 0.145 0.2413 0.345 0.207 0.110];
SLT = [0.055 0.048 0.090 0.103 0.090 0.055];
eTp = [0.081 0.014 0.02 0.02 0.02 0.02];
Em = [2.21 3.45 3.45 5.17 3.45 3.24];

% Composite strength properties (GPa)
NameC = {'Boron/5505 boron/epoxy','AS/3501 carbon/epoxy',...
        'IM7/8551-7 carbon/epoxy','AS4/APC2 carbon/PEEK',...
		'B4/6061 boron/aluminum','Kevlar 49/934 aramid/epoxy',...
		'Scotchply 1002 E-glass/epoxy','E-glass/470-36/vinyl ester'};
SLPc = [1.586 1.448 2.578 2.06 1.373 1.379 1.103 0.584];
SLMc = [2.482 1.172 1.62 1.08 1.573 0.276 0.621 0.803];
STPc = [0.0627 0.0483 0.0758 0.078 0.118 0.0276 0.0276 0.043];
STMc = [0.241 0.248 0.248 0.196 0.157 0.0648 0.138 0.187];

    if vv == 0  % no variable volume fraction
        for i = 1:n
            % properties in table 4.1
            SLP(i) = SLPc(com(i));
            SLM(i) = SLMc(com(i));
            STP(i) = STPc(com(i));
            STM(i) = STMc(com(i));
        end

    elseif vv == 1   % yes variable volume fraction
        fs = zeros(1,n);
        F = zeros(1,n);
        for i = 1:n
            % longitudinal tensile strength
            SLP(i) = SLpf(fib(i))*f(i) + Sp(mat(i))*(1-f(i));
            % longitudinal compressive strength
            SLM(i) = (E1(i)*eTp(mat(i)))/v12(i);
            % transverse tensile strength
            fs(i) = fd(fib(i))/sqrt(4*f(i)/pi);
            F(i) = 1/(((fd(fib(i))/fs(i)))*((Em(mat(i))/Ef2(fib(i)))-1)+1);
            STP(i) = (E2(i)*Sm(mat(i)))/(Em(mat(i))*F(i));
            % transverse compressice strength
            STM(i) = Sm(mat(i));
        end
    end










