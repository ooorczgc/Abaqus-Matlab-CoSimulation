%job-1-1的联合仿真
%通过MATLAB输入立方体沿xyz方向的速度，得到其对应方向的位移曲线
%zzz 20230514

%--------------------
%配置立方体的运动速度
Vx=10;
Vy=15;
Vz=-20;
%--------------------


%--------------------
%这部分代码chatgpt说是为了更新matlab的工作目录
close all
S = mfilename('fullpath');
f = filesep;
ind=strfind(S,f);
S1=S(1:ind(end)-1);
cd(S1)

%--------------------
%删除已存在的结果文件
delete('Job-1-1.odb');
delete('Job-1-1.lck');

%--------------------
%调用inp_initial.m生成inp文件
inp_initial(Vx,Vy,Vz);
pause(2)

%--------------------
%将生成的inp文件提交运算
system('abaqus job=Job-1-1 cpus=4 interactive' )

%--------------------
%等待计算完成
while exist('Job-1-1.lck','file')==2
    pause(1)
end

while exist('Job-1-1.odb','file')==0
    pause(1)
end

%--------------------
%调用get_history_output()获取历程数据
req1='PART-CUBE-1,Node PART-CUBE-1.217,U1'; 
req2='PART-CUBE-1,Node PART-CUBE-1.217,U2'; 
req3='PART-CUBE-1,Node PART-CUBE-1.217,U3'; 
step='Step-1';
Path='F:\AbaqusResult\AbaqusMatlab\workspcae\job-1-1'; 
OdbFile='Job-1-1.odb';
get_history_output(Path,OdbFile,step,req1); 
get_history_output(Path,OdbFile,step,req2); 
get_history_output(Path,OdbFile,step,req3); 


%--------------------
%读取输出文件，绘制曲线图
filename1 = 'U1.txt';
filename2 = 'U2.txt';
filename3 = 'U3.txt';
data1 = readmatrix(filename1);
data2 = readmatrix(filename2);
data3 = readmatrix(filename3);
x = data1(:, 1);  
y1 = data1(:, 2);  
y2 = data2(:, 2); 
y3 = data3(:, 2); 

plot(x, y1, 'b-', x, y2, 'r-', x, y3, 'g-');
xlabel('时间');
ylabel('位移');
title('xyz位移曲线');
legend('x', 'y', 'z');
grid on;
















