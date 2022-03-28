function [NM] = appforces
% Allows user to input forces in units of MPa-mm and MPa-mm^2
    prompt = {'Nx (GPa mm):','Ny: (GPa mm)','Nxy: (GPa mm)',...
        'Mx: (GPa mm^2)','My: (GPa mm^2)','Mxy: (GPa mm^2)'};
    dlgtitle = 'Applied Forces';
    numlines = 1;
    definput = {'0','0','0','0','0','0'};
    options.Resize= 'on';
    NM = str2double(inputdlg(prompt,dlgtitle,numlines,definput,options));
end