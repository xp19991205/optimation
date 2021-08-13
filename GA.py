#这个代码用来示意遗传算法
import numpy as np
def schaffer(p):
#这是自定义的函数（即优化的目标函数）
    '''
    This function has plenty of local minimum, with strong shocks
    global minimum at (0,0) with value 0
    '''
    x1, x2 = p
    x = np.square(x1) + np.square(x2) #f(x1,x2) =0.5 + (sin^2(x1^2 + x2^2)-0.5)/ ((1+0.001*x)^2)
    return 0.5 + (np.square(np.sin(x)) - 0.5) / np.square(1 + 0.001 * x)
from sko.GA import GA
ga = GA(func=schaffer, n_dim=2, size_pop=50, max_iter=800, lb=[-1, -1], ub=[1, 1], precision=1e-7)
best_x, best_y = ga.run()
print('best_x:', best_x, '\n', 'best_y:', best_y) #这里对函数的最优值进行了求解

#绘图

import pandas as pd
import matplotlib.pyplot as plt

Y_history = pd.DataFrame(ga.all_history_Y)
print(Y_history)
fig, ax = plt.subplots(2, 1)
plt.rcParams['font.sans-serif']=['SimHei'] #指定默认字体 SimHei为黑体
plt.rcParams['axes.unicode_minus']=False #用来正常显示负号
print(Y_history.index)
ax[0].plot(Y_history.index, Y_history.values, '.', color='red')
ax[0].set_title('目标函数值优化路线')
ax[1].plot(Y_history.index,Y_history.min(axis=1).cummin())
# Y_history.min(axis=1).cummin().plot(kind='line')
ax[1].set_title('每代种群中的最优值')
plt.subplots_adjust(hspace=1, wspace=1)
plt.show() #第一张图片

#例子二
def my_fun(vector):
    x1,x2 = vector
    value = np.square(x1)+np.square(x2)
    return value

fig,ax = plt.subplots(2,1)
ga = GA(func=my_fun, n_dim=2, size_pop=50, max_iter=800, lb=[-1, -1], ub=[1, 1], precision=1e-7)
best_x, best_y = ga.run()
print('最优值自变量:', best_x, '\n', '最优值因变量:', best_y) #这里对函数的最优值进行了求解
Y_history = pd.DataFrame(ga.all_history_Y) #历史的优化迭代值Y（类型为List）
# plt.plot(Y_history.index,Y_history.values,'-.', color = 'blue')
ax[0].plot(Y_history.index, Y_history.values, '.', color='red')
ax[0].set_title('每次迭代各个种群的函数值')
ax[1].plot(Y_history.index,Y_history.min(axis=1).cummin())
ax[1].set_title('每次迭代各个种群的最优函数值')
plt.subplots_adjust(hspace= 0.5)
# Y_history.min(axis=1).cummin().plot(kind='line') #800代，每代50个体(800*50) 绘制每一代的最小的y值
plt.show() #第二张图
#Dataframe的方法：cummin()
#计算累计最小值，例如，一个序列为3 4 5 5 4 3 那么生成的序列为 【3 3 3 3 3 3】，【inf 1 0 -1 2】对应【inf 1 0 -1 -1】
#先计算每一代里面最优的个体的函数值，再累计绘制全部的最优个体
# plt.show()
# print(Y_history.values)
''''''
# figure = plt.figure(figsize= (30,30),dpi=30)
# x = np.linspace(0,2*np.pi,100)
# y1 = np.sin(x)
# y2 = np.cos(x)
# Y = np.array([y1,y2]).transpose()#Y:100*2 x:100*1
# plt.plot(x,Y)
# plt.show()
''''''
#上面的这段代码只用了一个X，
