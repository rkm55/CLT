clear; clc; close all;
% temp file for in class exercises

%% In class exercise
% suppose that you are designing a wind turbine blade that is 50m long. 
% Will glass / epoxy composite take the weight, or should you use carbon 
% epoxy (both with 50% vf)?
% At the base, assume it has a circular cross section, of 2m diameter and 
% with 15mm thick section.
% If it is made of glass it will weigh 10,000 kg; if it is made of carbon 
% it will weigh 7,775 kg.
% Initially assume all 0o fibers in either design, and then briefly discuss
% implications of more practical layups 
% (e.g. +/- 45 or 90 layers; see Table 4.1 for strength properties of 
% AS3501 and Scotchply 1002, for example)
w = 10000;
I = (pi/2)*(1^4 - 0.985^4);
sigma = (25*(9.81*10000)*1)/I;

disp('Stress MPa (glass fibers)')
disp(sigma/1e6)
disp(' ')
disp('Both glass and carbon fibers are sufficiently')
disp('strong when considering both stresses due to ')
disp('gravitational force and centripetal force.')
disp(' ')
disp(' ')

