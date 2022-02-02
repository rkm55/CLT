clear; clc; close all;

% temp file for testing

%% In class exercise
% A [+45/-45/-45/+45] symmetric angle-ply laminate of 0.25 mm thick 
% unidirectional AS3501 carbon/epoxy laminae is pulled in tension such 
% that there is no curvature, and the resulting neutral axis strains are:
% eps^0_x=.002138, eps^0_y=-.001485, gamma^0_xy=0
% What are the stresses on the top +45 lamina?

lam = [45 -45 -45 45];  % laminate properties and given values
E1 = 138;   % GPa
E2 = 9;
G12 = 6.9;
v12 = 0.3;
ex = -0.002138;
ey = 0.001485;
gxy = 0;

strain = [ex; ey; gxy];
Qbar45 = [45.2 31.42 32.44; 31.42 45.2 32.44; 32.44 32.44 35.6];

stress = 1000*(Qbar45*strain);
disp(' ')
disp('Stress (MPa)')
disp(' ')
disp(['Stress x = ',num2str(stress(1,1))])
disp(['Stress y = ',num2str(stress(2,1))])
disp(['Shear xy = ',num2str(stress(3,1))])






