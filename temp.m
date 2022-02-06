clear; clc; close all;

% temp file for testing

%% In class exercise: calculating B
% A [45/0] laminate made from E-glass and polyurethane has a 3mm 45o layer
% and a 5 mm 0o layer. Calculate the coupling stiffness matrix, B, for the 
% force-deformation equation.
n = 2;              % # of layers
theta = [45 0];     % layer orientations
t = [3 5];          % layer thicknesses (mm)
Q = zeros(3,3,n);
Q(:,:,1) = [20 0.7 0; 0.7 2 0; 0 0 0.7];    % given Q matrix (GPa)
Q(:,:,2) = Q(:,:,1);
Qbar = zeros(3,3,n);
for i = 1:n
    % Transformation matrix calculations
    s = sind(theta(i));
    c = cosd(theta(i));
    T = [c^2 s^2 2*c*s; s^2 c^2 -2*c*s; -c*s c*s c^2-s^2];
    T2 = [T(1,1) T(1,2) T(1,3)/2;...
        T(2,1) T(2,2) T(2,3)/2; 2*T(3,1) 2*T(3,2) T(3,3)];
    % Qbar calculations: inv(T)*Q*T2
    Qbar(:,:,i) = T\Q(:,:,i)*T2;
end
% Coupling stiffnes matrix B calculation
[A,B,D,z] = macrostiffness(Qbar,t,n);   % macrostiffness function CLT
ABBD = [A B; B D];
disp(' ')
disp('B (GPa mm^2)')
disp(' ')
disp(B)




