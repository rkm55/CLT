function [SLP SLM STP STM] = strengthparam
% -------------------------------------------
% Fiber strength properties (GPa)
NameF = {'Boron','HMS','AS','T300','KEV','S-G','E-G'};
SLpf = [4.140 1.720 2.410 2.410 2.760 4.140 2.760];
SLmf = [4.830 1.380 1.790 2.070 0.517 0 0];

% Matrix strength properties (GPa)
NameM = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
Sp = [0.055 0.048 0.1034 0.138 0.103 0.379];
Sm = [0.103 0.145 0.2413 0.345 0.207 0.110];
SLT = [0.055 0.048 0.090 0.103 0.090 0.055];

% Composite strength properties (GPa)
NameC = {'Boron/5505 boron/epoxy','AS/3501 carbon/epoxy',...
        'IM7/8551-7 carbon/epoxy','AS4/APC2 carbon/PEEK',...
		'B4/6061 boron/aluminum','Kevlar 49/934 aramid/epoxy',...
		'Scotchply 1002 E-glass/epoxy','E-glass/470-36/vinyl ester'};