#!/user/bin/python
#-coding:UTF-8-*
#odbHistoryOutput.py
#本脚本的功能是按照req.txt文件指定的要求，读取输出数据库*.odb的历史数据
#导入abaqus odbAcess模块
from odbAccess import *
import time
#获取matlab指定的数据库，部件名，节点，特定结果的信息
f=open('req.txt','r')
req=f.readline()
f.close()
req=req.split(',')
path=req[0]+'/'+req[1]
step=req[2]
instance=req[3]
node_set=req[4]
ReqData=req[5]
#输出提示信息
fmeg=open('pylog.txt','w')
meg='------------------\n'
meg=meg+'odb_HistoryOutput message: \n'
meg=meg+time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))+'n'
meg=meg+'read'+node_set+''+ReqData+'from \n'+path
print meg
fmeg.write('%s\n'%meg)
#打开odb数据库
odb=openOdb(path=path)
#输出提信息
meg='open odb successfully \n'
fmeg.write('%s'%meg)
print meg
#创建变量表示第n个分析步
step_n=odb.steps[step]
#创建变量表示第1个分析步的最后一帧
lastFrame=step_n.frames[-1]
#获取历史输出区域
region=step_n.historyRegions[node_set]
#出提示信息
meg='get nodes sets successfully\n'
fmeg.write('%s'%meg)
print meg
#获取结果
GetData=region.historyOutputs[ReqData].data
DataFile=open(ReqData+'.txt','w')
for time,Data in GetData:
    DataFile.write('%10.4E %10.4E\n'%(time,Data))
DataFile.close()
#输出提示信息
meg='get data successfully\n'
fmeg.write('%s'%meg)
print meg
fmeg.close()
