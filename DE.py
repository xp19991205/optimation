'''
min f(x1, x2, x3) = x1^2 + x2^2 + x3^2
s.t.
    x1*x2 >= 1
    x1*x2 <= 5
    x2 + x3 = 1
    0 <= x1, x2, x3 <= 5
'''
#这个代码示意了利用差分进化算法（Differential Evolution，DE），求解函数最优值
#用途：用于求解连续最优化变量


def obj_func(p):
    x1, x2, x3 = p
    return x1 ** 2 + x2 ** 2 + x3 ** 2
    # return -x1**2 - x2 **2 - x3**2 如果最大化可以采用这种方式

constraint_eq = [
    lambda x: 1 - x[1] - x[2]
]

constraint_ueq = [
    lambda x: 1 - x[0] * x[1],
    lambda x: x[0] * x[1] - 5
] #这里输入的是<=的不等式

from sko.DE import DE

de = DE(func=obj_func, n_dim=3, size_pop=50, max_iter=1000, lb=[0, 0, 0], ub=[5, 5, 5],
        constraint_eq=constraint_eq, constraint_ueq=constraint_ueq)
#这里需要对这个函数的参数做出解释
# func= 自定义函数名
# n_dim = 自变量维度
# size_pop= 初始化种群数
# max_iter= 最大迭代次数
best_x, best_y = de.run()
print('best_x:', best_x, '\n', 'best_y:', best_y)



