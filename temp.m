clear; clc;
vv = 1;
n = 2;

% Fiber material properties. E values in Pa
listfib = {'Boron','HMS','AS','T300','KEV','S-G','E-G'};
Ef1a = [3.998952e+11 3.79211e+11 2.137371e+11 2.206318e+11 1.516844e+11 8.549484e+10 7.30843e+10];
Ef2a = [3.998952e+11 6.20527e+9 1.378949e+10 1.378949e+10 4.136847e+9 8.549484e+10 7.30843e+10];
vf12a = [0.2 0.2 0.2 0.2 0.35 0.2 0.22];
Gf12a = [1.668528e+11 7.584219e+9 1.378949e+10 8.963168e+9 2.895793e+9 3.564583e+10 3.013003e+10];

% Matrix material properties. E values in Pa
listmat = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
Ema = [2.206318e+9 3.447372e+9 3.447372e+9 5.171059e+9 3.447372e+9 3.24053e+9];
vma = [0.43 0.41 0.35 0.35 0.35 0.36];
Gma = Ema./(2.*(1+vma));

    if vv == 0  % no variable vf
    
    
    elseif vv == 1 % yes variable vf
        % Preallocating arrays
        f = zeros(1,n);
        E1 = zeros(1,n);
        v12 = zeros(1,n);
        E2 = zeros(1,n);
        G12 = zeros(1,n);
        % Properties of each layer
        for i = 1:n 
            [fiber,matrix] = choosematerial(i);
            % Fiber/matrix properties for chosen materials
            Ef1 = Ef1a(fiber);
            Ef2 = Ef2a(fiber);
            vf12 = vf12a(fiber);
            Gf12 = Gf12a(fiber);
            Em = Ema(matrix);
            vm = vma(matrix);
            Gm = Gma(matrix);
            % volume fraction input for each layer
            f(i) = str2double(inputdlg(['Input fiber volume fraction between 0 and 1 for layer ',num2str(i)]...
            ,'Volume Fraction',1));
            if f(i) < 0 || f(i) > 1
                f(i) = 0.5;
            end
            % Properties for each layer calculated
            E1(i) = Ef1*f(i) + Em*(1-f(i));
            v12(i) = vf12*f(i) + vm*(1-f(i));
            E2(i) = Em*((1-sqrt(f(i)))+(sqrt(f(i))/(1-(sqrt(f(i))*(1-(Em/Ef2))))));
            G12(i) = 1/(f(i)/Gf12) + ((1-f(i))/Gm);
        end
    end

    % Thickness of each layer (m)
        t = zeros(1,n);
        for i = 1:n
            t(i) = (1/1000)*str2double(inputdlg(['Input thickness (mm) for layer ',num2str(i)]...
            ,'Thickness',1));
            if t(i) <= 0
                t(i) = 0.0025;
            end
        end

    % enter orientation angle for each layer






