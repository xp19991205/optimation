import numpy as np
from scipy import spatial
import matplotlib.pyplot as plt

num_points = 50

points_coordinate = 100*np.random.rand(num_points, 2)  # generate coordinate of points 这里输入的是TSP问题中的点
#[[20,2]
# [50,1]
# ...]
distance_matrix = spatial.distance.cdist(points_coordinate, points_coordinate, metric='euclidean')


def cal_total_distance(routine): #根据所有的距离矩阵计算整个路径的distance之和
    '''The objective function. input routine, return total distance.
    cal_total_distance(np.arange(num_points))
    '''
    num_points, = routine.shape
    return sum([distance_matrix[routine[i % num_points], routine[(i + 1) % num_points]] for i in range(num_points)])

from sko.GA import GA_TSP #从该工具包中导入TSP工具包

ga_tsp = GA_TSP(func=cal_total_distance, n_dim=num_points, size_pop=50, max_iter=500, prob_mut=1)
# func= 目标函数,在这里是TSP路径中的总距离
# n_dim=num_points 总共的TSP点数 这里把所有点看作输入自变量维度
# size_pop= 种群数量
# max_iter= 最大迭代次数
# prob_mut= 变异概率
best_points, best_distance = ga_tsp.run()
#best_points 代表最优路径的点的序号
print("最优距离为"+str(best_distance))
fig, ax = plt.subplots(1, 2)
# ax :可以理解为matlab中的subplot(1,1) 就是对一幅图的划分
best_points_ = np.concatenate([best_points, [best_points[0]]]) #将生成路径首尾相连
best_points_coordinate = points_coordinate[best_points_, :]#获取对应路径的坐标
ax[0].plot(best_points_coordinate[:, 0], best_points_coordinate[:, 1], 'o-r')
ax[1].plot(ga_tsp.generation_best_Y)
plt.show()
print("最优路径为"+str(best_points_))