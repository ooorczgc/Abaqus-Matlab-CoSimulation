# Abaqus-Matlab-CoSimulation

Abaqus与MATLAB的联合仿真模型。

使用matlab控制abaqus模型中立方体的速度，返回立方体位移曲线。

我的学习笔记链接：

>→→→[【暂未公布】]()

我的CSDN主页链接：

>→→→[【我的CSDN主页】](https://blog.csdn.net/ooorczgc)

---

## 参考资料：

CSDN：

>→→→[【Matlab-python-ABAQUS数据交互及联合使用】](https://blog.csdn.net/hdpai2018/article/details/106113842)

>→→→[【abaqus与matlab联合仿真】](https://blog.csdn.net/mint_rain/article/details/113749323)

Youtube：

>→→→[【Abaqus parameter Optimization from Matlab】](https://www.youtube.com/watch?v=3UcHLktJ46s)

>→→→[【Read Abaqus results from Matlab】](https://www.youtube.com/watch?v=CrtS8YGCO_s)

---

## 文件说明

### AbaqusMatlab.cae

Abaqus有限元分析模型，用来生成inp文件。

### Co_Simulation.m

联合仿真的执行脚本，实现inp文件生成，inp文件提交给abaqus计算，提取odb文件中的结果，绘制曲线。

### odbHistoryOutput.py

实现提取odb文件中的历程数据的python脚本文件。

### get_history_output.m

调用 odbHistoryOutput.py 脚本的函数。

### inp2mfile.m

将abaqus生成的inp文件转化成matlab脚本文件的脚本文件。

### inp_initial.m

使用 inp2mfile.m 脚本生成的，用来生成修改后的inp文件的脚本文件。

### Job-1-1.inp

使用 inp_initial.m 脚本生成的修改后的inp文件，用来提交给abaqus运算。












