function [fiber] = choosefiber(i)
% Allows user to select fiber material from 7 different materials
    list = {'Boron','HMS','AS','T300','KEV','S-Glass','E-Glass'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        ['Select a fiber material for layer ',num2str(i)],'SelectionMode',...
        'single','Name','Fiber Material','ListSize',[250 100]);
    if tf == 0
        fiber = 1;
    else
        fiber = indx;
    end
end