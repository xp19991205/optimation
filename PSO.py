#这里展示的是粒子群算法的代码
def demo_func(x):
    x1, x2, x3 = x
    return x1 ** 2 + (x2 - 0.05) ** 2 + x3 ** 2

from sko.PSO import PSO
pso = PSO(func=demo_func, n_dim=3, pop=40, max_iter=150, lb=[0, -1, 0.5], ub=[1, 1, 1], w=0.8, c1=0.5, c2=0.5)
#w代表惯性 （inertia）粒子群以一定速度进行运动
#c1、c2分别用于控制个体最佳和全局最佳(parameters to control personal best, global best respectively)
#c1和c2被称为社会学习因子和个体学习因子
#来自个体的影响主要指的是个体以前发现的较优值 来自社会的影响主要指当前全局的一个最优在哪
pso.run()
print('best_x is ', pso.gbest_x, 'best_y is', pso.gbest_y)
import matplotlib.pyplot as plt
plt.plot(pso.gbest_y_hist)
plt.show()

