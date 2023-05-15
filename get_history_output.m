%get_history_output.m
%运行python脚本，读取odb数据库的历史输出

function get_history_output(Path,OdbFile,step,req)
%specified part instance,node set,output
%参数写入Abaqus工作目灵
ReqFile=[Path,'\req.txt'];
fid=fopen(ReqFile,'wt');
fprintf(fid,'%s,%s,%s,%s',Path,OdbFile,step,req);
fclose(fid);
%写入当前目录
ReqFile='req.txt';
fid=fopen(ReqFile,'wt');
fprintf(fid,'%s,%s,%s,%s',Path,OdbFile,step,req);
fclose(fid);
%execute python file
system('abaqus cae noGUI=odbHistoryOutput.py');%调用oython脚本
end