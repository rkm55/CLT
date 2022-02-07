clear; clc; close all;
% temp file for in class exercises

%% In class exercise
% Determine the stresses in the -45o layer of a [+45/-45/-45/+45] laminate 
% made of 0.25mm thick unidirectional AS/3501 carbon/epoxy laminate if a 
% uniaxial force of Nx=50MPa-mm per unit length is applied.
Qbar = [45.4748 31.6748 -32.6905; 31.6748   45.4748  -32.6905; -32.6905  -32.6905   35.8590];
% Qbar = [45.22 31.42 32.44; 31.42 45.22 32.44; 32.44 32.44 35.6];
z = [-0.50, -0.250, 0, 0.250, 0.50];
NM = [0.050; 0; 0; 0; 0; 0];
ABBD = [45.4747883349012 31.6747883349012 0 0 0 0; 31.6747883349012 45.4747883349012 0 0 0 0;...
    0 0 35.8589622982850 0 0 0; 0 0 0 3.78956569457510 2.63956569457510 2.04315616180621;...
    0 0 0 2.63956569457510 3.78956569457510 2.04315616180621; 0 0 0 2.04315616180621 2.04315616180621	2.98824685819041];
ek = ABBD\NM;
eps0 = [ek(1,1); ek(2,1); ek(3,1)];
k = [ek(4,1); ek(5,1); ek(6,1)];
% find stresses using eq. 7.34
n = 2;      % layer number (top down)
kth = n+1;    % kth lamina
% strain matrix from eq.7.34
strainmat = [eps0(1,1)+z(kth)*k(1,1);...
    eps0(2,1)+z(kth)*k(2,1);...
    eps0(3,1)+z(kth)*k(3,1);];
% Stress calculation
stressmat = Qbar*strainmat;
stressmat = stressmat*1000;
disp(' ')   % display outputs
disp(['Stresses in the -45 layer (layer ',num2str(n),')'])
disp(' ')
disp(['  Sigma_x =  ',num2str(stressmat(1,1)),' MPa'])
disp(' ')
disp(['  Sigma_y =  ',num2str(stressmat(2,1)),' MPa'])
disp(' ')
disp(['  Tau_xy  =  ',num2str(stressmat(3,1)),' MPa'])
disp(' ')
disp(' ')
clc; clear; close all;
%% In class exercise: Stress in 45 laminate
t = [0.25 0.25 0.25 0.25];
n = 4;
Qbar = zeros(3,3,n);
Qbar(:,:,1) = [45.22 31.42 32.44; 31.42 45.22 32.44; 32.44 32.44 35.6];
Qbar(:,:,4) = Qbar(:,:,1);
Qbar(:,:,2) = [45.22 31.42 -32.44; 31.42 45.22 -32.44; -32.44 -32.44 35.6];
Qbar(:,:,3) = Qbar(:,:,2);
[A,B,D,z] = macrostiffness(Qbar,t,n);
ABBD = [A B; B D];
NM = [0.05; 0; 0; 0; 0; 0];
ek = ABBD\NM;
eps0 = [ek(1,1); ek(2,1); ek(3,1)];
k = [ek(4,1); ek(5,1); ek(6,1)];
n = 2;      % layer number (top down)
kth = n+1;    % kth lamina
% strain matrix from eq.7.34
strainmat = [eps0(1,1)+z(kth)*k(1,1);...
    eps0(2,1)+z(kth)*k(2,1);...
    eps0(3,1)+z(kth)*k(3,1);];
% Stress calculation
stressmat = Qbar(:,:,n)*strainmat;
stressmat = stressmat*1000;
disp(' ')   % display outputs
disp(['Stresses in the -45 layer (layer ',num2str(n),')'])
disp(' ')
disp(['  Sigma_x =  ',num2str(round(stressmat(1,1),2)),' MPa'])
disp(' ')
disp(['  Sigma_y =  ',num2str(round(stressmat(2,1),2)),' MPa'])
disp(' ')
disp(['  Tau_xy  =  ',num2str(round(stressmat(3,1),2)),' MPa'])
disp(' ')
disp(' ')

