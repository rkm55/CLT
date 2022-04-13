function [E1,E2,G12,v12,t,f,theta,NameC,com,NameF,fib,NameM,mat] = eparam(n,vv)
% Calculates layer properties for variable and nonvariable volume fraction

% Fiber material properties. E values in GPa
NameF = {'Boron','HMS  ','AS   ','T300 ','KEV  ','S-G  ','E-G  '};
Ef1a = [400 379 213.7 221 152 85.5 73.1];
Ef2a = [400 6.21 13.8 13.8 4.14 85.5 73.1];
vf12a = [0.2 0.2 0.2 0.2 0.35 0.2 0.22];
Gf12a = [167 7.58 13.8 8.96 2.9 35.6 30.1];
fib = zeros(1,n);

% Matrix material properties. E values in GPa
NameM = {'LM       ','IMLS     ','IMHS     ','HM       ','Polyimide','PMR      '};
Ema = [2.21 3.45 3.45 5.17 3.45 3.24];
vma = [0.43 0.41 0.35 0.35 0.35 0.36];
Gma = Ema./(2.*(1+vma));
mat = zeros(1,n);

% Composite material properties. E values in GPa
NameC = {'Boron/5505 boron/epoxy','AS/3501 carbon/epoxy',...
        'IM7/8551-7 carbon/epoxy','AS4/APC2 carbon/PEEK',...
		'B4/6061 boron/aluminum','Kevlar 49/934 aramid/epoxy',...
		'Scotchply 1002 E-glass/epoxy','E-glass/470-36/vinyl ester'};
Ec1 = [204 139 162 131 235 75.8 38.6 24.4];
Ec2 = [18.5 9 8.34 8.7 137 5.5 8.27 6.87];
Gc12 = [5.59 6.9 2.07 5 47 2.3 4.14 2.89];
vc12 = [0.23 0.3 0.34 0.28 0.3 0.34 0.26 0.32];
fc = [0.5 0.65 0.6 0.58 0.5 0.65 0.45 0.3];
com = zeros(1,n);

% Preallocating arrays
f = zeros(1,n);
E1 = zeros(1,n);
v12 = zeros(1,n);
E2 = zeros(1,n);
G12 = zeros(1,n);

    if vv == 0  % no variable vf
        % Choose composite for all layers
        [composite] = choosecomposite;
        for i = 1:n
            E1(i) = Ec1(composite);
            v12(i) = vc12(composite);
            E2(i) = Ec2(composite);
            G12(i) = Gc12(composite);
            f(i) = fc(composite);
            com(i) = composite;
        end
    
    elseif vv == 1 % yes variable vf
        % Choose matrix for all layers
        [matrix] = choosematrix;
        for i = 1:n 
            % Choose fiber material for each layer
            [fiber] = choosefiber(i);
            fib(i) = fiber;
            mat(i) = matrix;
            % Fiber/matrix properties for chosen materials
            Ef1 = Ef1a(fiber);
            Ef2 = Ef2a(fiber);
            vf12 = vf12a(fiber);
            Gf12 = Gf12a(fiber);
            Em = Ema(matrix);
            vm = vma(matrix);
            Gm = Gma(matrix);
            % volume fraction input for each layer
            definput= {'0.5'};
            options.Resize= 'on';
            f(i) = str2double(inputdlg(['Input fiber volume fraction between 0 and 1 for layer ',num2str(i)]...
            ,'Volume Fraction',1,definput,options));
            if f(i) < 0 || f(i) > 1
                f(i) = 0.5;
            end
            % Properties for each layer calculated
            E1(i) = Ef1*f(i) + Em*(1-f(i));
            v12(i) = vf12*f(i) + vm*(1-f(i));
            E2(i) = Em*((1-sqrt(f(i)))+(sqrt(f(i))/(1-(sqrt(f(i))*(1-(Em/Ef2))))));
            G12(i) = Gm*((1-sqrt(f(i)))+(sqrt(f(i))/(1-(sqrt(f(i))*(1-(Gm/Gf12))))));
        end
    end

    % Thickness of each layer (mm)
    t = zeros(1,n);
    for i = 1:n
        definput= {'0.3'};
        options.Resize= 'on';
        t(i) = str2double(inputdlg(['Input thickness (mm) for layer ',num2str(i)]...
        ,'Thickness',1,definput,options));
        if t(i) <= 0
            t(i) = 0.0025;
        end
    end

    % Orientation angle for each layer
    theta = zeros(1,n);
    for i = 1:n
        definput= {'0'};
        options.Resize= 'on';
        theta(i) = str2double(inputdlg(['Input orientation angle (-90 to 90) for layer ',num2str(i)]...
        ,'Orientation',1,definput,options));
        if theta(i) < -90 || theta(i) > 90
            theta(i) = 0;
        elseif theta(i) == -90
            theta(i) = 90;
        end
    end
end