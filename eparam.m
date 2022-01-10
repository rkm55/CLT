function [E1,E2,G12,v12,t,f,theta] = eparam(n,vv)
% Calculates layer properties for variable and nonvariable volume fraction

% Fiber material properties. E values in Pa
listfib = {'Boron','HMS','AS','T300','KEV','S-G','E-G'};
Ef1a = [4e+11 3.79e+11 2.137e+11 2.21e+11 1.52e+11 8.55e+10 7.31e+10];
Ef2a = [4e+11 6.21e+9 1.38e+10 1.38e+10 4.14e+9 8.55e+10 7.31e+10];
vf12a = [0.2 0.2 0.2 0.2 0.35 0.2 0.22];
Gf12a = [1.67e+11 7.58e+9 1.38e+10 8.96e+9 2.9e+9 3.56e+10 3.01e+10];

% Matrix material properties. E values in Pa
listmat = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
Ema = [2.21e+9 3.45e+9 3.45e+9 5.17e+9 3.45e+9 3.24e+9];
vma = [0.43 0.41 0.35 0.35 0.35 0.36];
Gma = Ema./(2.*(1+vma));

% Composite material properties. E values in Pa
listcom = {'Boron/5505 boron/epoxy','AS/3501 carbon/epoxy',...
        'IM7/8551-7 carbon/epoxy','AS4/APC2 carbon/PEEK','B4/6061 boron/aluminum',...
        'Kevlar 49/934 aramid/epoxy','Scotchply 1002 E-glass/epoxy',...
        'E-glass/470-36/vinyl ester'};
Ec1 = [204e9 139e9 162e9 131e9 235e9 75.8e9 38.6e9 24.4e9];
Ec2 = [18.5e9 9e9 8.34e9 8.7e9 137e9 5.5e9 8.27e9 6.87e9];
Gc12 = [5.59e9 6.9e9 2.07e9 5e9 47e9 2.3e9 4.14e9 2.89e9];
vc12 = [0.23 0.3 0.34 0.28 0.3 0.34 0.26 0.32];
fc = [0.5 0.65 0.6 0.58 0.5 0.65 0.45 0.3];

% Preallocating arrays
f = zeros(1,n);
E1 = zeros(1,n);
v12 = zeros(1,n);
E2 = zeros(1,n);
G12 = zeros(1,n);

    if vv == 0  % no variable vf
        % Properties of each layer
        for i = 1:n
            [composite] = choosecomposite(i);
            E1(i) = Ec1(composite);
            v12(i) = vc12(composite);
            E2(i) = Ec2(composite);
            G12(i) = Gc12(composite);
            f(i) = fc(composite);
        end
    
    elseif vv == 1 % yes variable vf
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

    % Orientation angle for each layer
    theta = zeros(1,n);
    for i = 1:n
        theta(i) = str2double(inputdlg(['Input orientation angle (-90 to 90) for layer ',num2str(i)]...
        ,'Orientation',1));
        if theta(i) < -90 || theta(i) > 90
            theta(i) = 0;
        elseif theta(i) == -90
            theta(i) = 90;
        end
    end
end