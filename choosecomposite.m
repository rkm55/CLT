function [composite] = choosecomposite(i)
% Allows user to select from premade composite materials for each layer
    list = {'Boron/5505 boron/epoxy','AS/3501 carbon/epoxy',...
        'IM7/8551-7 carbon/epoxy','AS4/APC2 carbon/PEEK','B4/6061 boron/aluminum',...
        'Kevlar 49/934 aramid/epoxy','Scotchply 1002 E-glass/epoxy',...
        'E-glass/470-36/vinyl ester'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        ['Select a composite material for layer ',num2str(i)],'SelectionMode',...
        'single','Name','Composite Material','ListSize',[250 115]);
    if tf == 0
        composite = 1;
    else
        composite = indx;
    end
end