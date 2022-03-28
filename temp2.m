clear; clc; close all;
% temp file for in class exercises

%% In class exercise
% Randomly oriented fibers code for modulus E
d = 7e-6;
Ef1 = 230e9;
Em = 2e9;
Gm = 0.77e9;
L = 5e-3;

B = sqrt(((2*pi*Gm)/((pi/4)*d^2*Ef1*log(1/sqrt(0.5)))));
Bb = (B/2)*L;
Ecox = Ef1*((1-(tanh(Bb)/Bb)))*0.5 + Em*0.5;

E = quad(@calcEx,0,pi)/pi;

clc;
disp(' ')
disp(' ')
disp('Modulus of Randomly Oriented Discontinuous Fiber')
disp(' ')
disp([num2str(E/1e9),' GPa'])
disp(' ')

function Ex = calcEx(theta)
    E2 = 9e9;
    G12 = 6e9;
    v12 = 0.3;
    E1 = 1.1484e11;
    Ex = 1./((cos(theta).^4./E1)+((-v12./E1)+(1./G12)).*cos(theta).^2.*sin(theta).^2 +(sin(theta).^4./E2));
end
