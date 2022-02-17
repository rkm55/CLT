clear; clc; close all;
% temp file for in class exercises

%% In class exercise
% You are making a shipping container with glass fiber panels. These must
% be stacked, and hence undergo high axial loads. The +45o laminate of 
% 45% glass fiber in epoxy is loaded in compression along the vertical 
% % x-axis. At what stress will it fail using the maximum strain criterion?
theta = 45;
s = sind(theta);
c = cosd(theta);
SLP = 1103;
STM = 138;
SLT = 82.7;
v12 = 0.32;
v21 = 0.09;
x1 = SLP/(c^2-v12*s^2);
x2 = STM/(s^2-v21*c^2);
x3 = SLT/(s*c);

sigmax = min([x1 x2 x3]);
disp(' ')
disp('Max strain criterion:')
disp('failure due to shear, max stress = ')
disp(['   ',num2str(sigmax),' MPa'])
disp(' ')
disp(' ')

%% Tsai-Hill
SLM = 621;

xTH = sqrt(1/((c^4/SLM^2)+((1/SLT^2)-(1/SLM^2))*s^2*c^2 + (s^4/STM^2)));
disp(' ')
disp('Tsai-Hill criterion:')
disp('failure max stress = ')
disp(['   ',num2str(xTH),' MPa'])
disp(' ')
disp(' ')




















