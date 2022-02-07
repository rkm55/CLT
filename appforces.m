function [NM] = appforces
% Allows user to input forces in units of MPa-mm and MPa-mm^2
    prompt = {'Nx (MPa mm):','Ny: (MPa mm)','Nxy: (MPa mm)',...
        'Mx: (MPa mm^2)','My: (MPa mm^2)','Mxy: (MPa mm^2)'};
    dlgtitle = 'Applied Forces';
    numlines = 1;
    definput = {'0','0','0','0','0','0'};
    options.Resize= 'on';
    NM = str2double(inputdlg(prompt,dlgtitle,numlines,definput,options));
    % Output in units of GPa-mm and GPa-mm^2
    NM = NM/1000;
end