function output(n,NameM,mat,NameF,fib,E1,E2,G12,f,t,theta,maxstrain,maxstress,tsai_hill,ABBD,sigmabarT,sigmabarB,epsbarT,epsbarB,NM,vv,NameC,com)
% outputs results to .txt file
filename = 'output_CLT.txt'; 
fid = fopen(filename,'w');
% Title
fprintf(fid,'%s',filename);
fprintf(fid,'\t\tNumber of plies: %s',num2str(n));
fprintf(fid,'\t\tGenerated: %s \r\n',date);
fprintf(fid,'Units: (GPa,mm) \r\n');
% Laminate Info
if vv == 1  % yes variable vf
    fprintf(fid,'\nLayup Info:');
    fprintf(fid,'\n\tMatrix\tFiber\tvf\tThick\tTheta\tE1\tE2\tG12');
    for i = 1:n
        fprintf(fid,'\n%s',num2str(i));
        fprintf(fid,'\t%s',string(NameM(mat(i))));
        fprintf(fid,'\t%s',string(NameF(fib(i))));
        fprintf(fid,'\t%4.2f',f(i));
        fprintf(fid,'\t%4.2f',t(i));
        fprintf(fid,'\t%4.0f',theta(i));
        fprintf(fid,'\t%4.2f',E1(i));
        fprintf(fid,'\t%4.2f',E2(i));
        fprintf(fid,'\t%4.2f',G12(i));
    end
elseif vv == 0  % no variable vf
    fprintf(fid,'\n\nLayup Info:');
    fprintf(fid,'\n\tComposite\tvf\tThick\tTheta\tE1\tE2\tG12');
    for i = 1:n
        fprintf(fid,'\n%s',num2str(i));
        fprintf(fid,'\t%s',string(NameC(com(i))));
        fprintf(fid,'\t%4.2f',f(i));
        fprintf(fid,'\t%4.2f',t(i));
        fprintf(fid,'\t%4.0f',theta(i));
        fprintf(fid,'\t%4.2f',E1(i));
        fprintf(fid,'\t%4.2f',E2(i));
        fprintf(fid,'\t%4.2f',G12(i));
    end
end
% Applied Forces
fprintf(fid,'\n\nApplied Forces (NM)');
fprintf(fid,'\n%4.4f',NM);
% Failure Criteria
fprintf(fid,'\n\nFailure Criteria (1 signifies failure)');
fprintf(fid,'\nRows = plies, columns = failure mode');
% Max Strain
fprintf(fid,'\n\nMax Strain:');
if sum(maxstrain,'all') == 0
    res = 'Pass';
else
    res = 'Fail';
end
fprintf(fid,' %s',res);
fprintf(fid,'\n\tLong\tTran\tShear');
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t%s',num2str(maxstrain(1,i)));
      fprintf(fid,'\t%s',num2str(maxstrain(2,i)));
      fprintf(fid,'\t%s',num2str(maxstrain(3,i)));
end
% Max Stress
fprintf(fid,'\n\nMax Stress:');
if sum(maxstress,'all') == 0
    res = 'Pass';
else
    res = 'Fail';
end
fprintf(fid,' %s',res);
fprintf(fid,'\n\tLong\tTran\tShear');
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t%s',num2str(maxstress(1,i)));
      fprintf(fid,'\t%s',num2str(maxstress(2,i)));
      fprintf(fid,'\t%s',num2str(maxstress(3,i)));
end
% Tsai-Hill
fprintf(fid,'\n\nTsai-Hill:');
if sum(tsai_hill,'all') == 0
    res = 'Pass';
else
    res = 'Fail';
end
fprintf(fid,' %s',res);
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t%s',num2str(tsai_hill(i)));
end
% Stiffness ABBD
fprintf(fid,'\n\nABBD Stiffness Matrix:');
fprintf(fid,'\n%4.3f\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%4.3f',ABBD);
% Stresses
fprintf(fid,'\n\nStresses (rows = x, y, xy  columns = plies)');
fprintf(fid,'\n\nTop of plies (sigmabarT)');
for i = 1:3
    if i == 1
        fprintf(fid,'\nx');
    elseif i == 2
        fprintf(fid,'\ny');
    elseif i == 3
        fprintf(fid,'\nxy');
    end
    for j = 1:n
        fprintf(fid,'\t%4.4f',sigmabarT(i,j));
    end
end
fprintf(fid,'\n\nBottom of plies (sigmabarB)');
for i = 1:3
    if i == 1
        fprintf(fid,'\nx');
    elseif i == 2
        fprintf(fid,'\ny');
    elseif i == 3
        fprintf(fid,'\nxy');
    end
    for j = 1:n
        fprintf(fid,'\t%4.4f',sigmabarB(i,j));
    end
end
% Strains
fprintf(fid,'\n\nStrains (rows = x, y, xy  columns = plies)');
fprintf(fid,'\n\nTop of plies (epsbarT)');
for i = 1:3
    if i == 1
        fprintf(fid,'\nx');
    elseif i == 2
        fprintf(fid,'\ny');
    elseif i == 3
        fprintf(fid,'\nxy');
    end
    for j = 1:n
        fprintf(fid,'\t%4.6f',epsbarT(i,j));
    end
end
fprintf(fid,'\n\nBottom of plies (epsbarB)');
for i = 1:3
    if i == 1
        fprintf(fid,'\nx');
    elseif i == 2
        fprintf(fid,'\ny');
    elseif i == 3
        fprintf(fid,'\nxy');
    end
    for j = 1:n
        fprintf(fid,'\t%4.6f',epsbarB(i,j));
    end
end
end