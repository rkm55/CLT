function output(n,NameM,mat,NameF,fib,E1,E2,G12,f,t,theta,maxstrain,maxstress,tsai_hill,ABBD,sigmaT,sigmaB,epsT,epsB,NM,vv,NameC,com)
% outputs results to file

filename = 'output_CLT.txt'; 
fid = fopen(filename,'w');
% Title
fprintf(fid,'%s',filename);
fprintf(fid,'\t\tNumber of plies: %s',num2str(n));
fprintf(fid,'\t\tGenerated: %s \r\n',date);
fprintf(fid,'Units: (GPa,mm) \r\n');

% Laminate Info
if vv == 1  % yes variable vf
    fprintf(fid,'\n\nLayup Info:');
    fprintf(fid,'\n\tMatrix\t\tFiber\tvf\t\tThick\tTheta\tE1\t\t\tE2\t\tG12');
    for i = 1:n
        fprintf(fid,'\n%s',num2str(i));
        fprintf(fid,'\t%s',string(NameM(mat(i))));
        fprintf(fid,'\t%s',string(NameF(fib(i))));
        fprintf(fid,'\t%4.2f',f(i));
        fprintf(fid,'\t%4.2f',t(i));
        fprintf(fid,'\t%4.0f',theta(i));
        fprintf(fid,'\t%4.2f',E1(i));
        fprintf(fid,'\t\t%4.2f',E2(i));
        fprintf(fid,'\t%4.2f',G12(i));
    end
elseif vv == 0  % no variable vf
    fprintf(fid,'\n\nLayup Info:');
    fprintf(fid,'\n\tComposite\t\t\t\tvf\t\tThick\tTheta\tE1\t\t\tE2\t\tG12');
    for i = 1:n
        fprintf(fid,'\n%s',num2str(i));
        fprintf(fid,'\t%s',string(NameC(com(i))));
        fprintf(fid,'\t%4.2f',f(i));
        fprintf(fid,'\t%4.2f',t(i));
        fprintf(fid,'\t%4.0f',theta(i));
        fprintf(fid,'\t%4.2f',E1(i));
        fprintf(fid,'\t\t%4.2f',E2(i));
        fprintf(fid,'\t%4.2f',G12(i));
    end
end

% Applied Forces
fprintf(fid,'\n\nApplied Forces');
fprintf(fid,'\n%4.3f',NM);

% Failure
fprintf(fid,'\n\n\nFailure Criteria (1 signifies failure)');
fprintf(fid,'\nRows = plies, columns = failure mode');
fprintf(fid,'\n\nMax Strain');
fprintf(fid,'\n\t\tLong\tTran\tShear');
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t\t%s',num2str(maxstrain(1,i)));
      fprintf(fid,'\t\t%s',num2str(maxstrain(2,i)));
      fprintf(fid,'\t\t%s',num2str(maxstrain(3,i)));
end
fprintf(fid,'\n\nMax Stress');
fprintf(fid,'\n\t\tLong\tTran\tShear');
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t\t%s',num2str(maxstress(1,i)));
      fprintf(fid,'\t\t%s',num2str(maxstress(2,i)));
      fprintf(fid,'\t\t%s',num2str(maxstress(3,i)));
end
fprintf(fid,'\n\nTsai-Hill');
for i = 1:n
      fprintf(fid,'\n%s',num2str(i));
      fprintf(fid,'\t\t%s',num2str(tsai_hill(i)));
end

% Stiffness, Stress, Strain
fprintf(fid,'\n\n\nStiffness, Stress, and Strain');
fprintf(fid,'\n\nABBD Stiffness Matrix:');
fprintf(fid,'\n%4.3f\t\t%4.3f\t\t%4.3f\t\t%4.3f\t\t%4.3f\t\t%4.3f',ABBD);
fprintf(fid,'\n\nStresses (rows = plies, columns = x y tau');
% fprintf(fid,'\nRows = plies, columns = failure direction');
fprintf(fid,'\n\nTop');
fprintf(fid,'\n%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f',sigmaT);
% fprintf(fid,'\n\nBottom');
% fprintf(fid,'\n%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f',sigmaB);
% fprintf(fid,'\n\nStrains (rows = plies, columns = x y tau');
% fprintf(fid,'\n\nTop');
% fprintf(fid,'\n%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f',epsT);
% fprintf(fid,'\n\nBottom');
% fprintf(fid,'\n%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f\t\t%4.4f',epsB);
end