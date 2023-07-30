% 功能：使用遗传算法查找一元函数的最大值

%% I. 清空环境变量
clc
close all
addpath('../gaot') %添加 gaot工具箱
clear all

%% II. 绘制函数曲线
x = 0:0.01:9;
y =  x + 10*sin(5*x)+7*cos(4*x);

figure
plot(x, y)
xlabel('自变量')
ylabel('因变量')
title('y = x + 10*sin(5*x) + 7*cos(4*x)')
grid % 添加网格

%% III. 初始化种群initializega
initPop = initializega(50,[0 9],'fitness');    %种群大小；变量变化范围；适应度函数的名称
%看一下initpop     第二列代表   适应度函数值

%% IV. 遗传算法优化ga
[x endPop bpop trace] =... % [最优个体, 优化终止的最优种群, 最优种群的进化轨迹, 进化迭代过程中]
    ga([0 9],... %变量范围上下界
    'fitness',[],... %适应度函数；适应度函数的参数
    initPop,[1e-6 1 1],... %初始种群；精度和显示方式
    'maxGenTerm',25,...% 终止函数的名；终止函数的参数
    'normGeomSelect',0.08,...% 选择函数的名称；选择函数的参数
    'arithXover',2,...% 交叉函数的名称；交叉函数的参数
    'nonUnifMutation',[2 25 3]); % 变异函数的名称；变异函数的参数

%% V. 输出最优解并绘制最优点
x
hold on
plot (endPop(:,1),endPop(:,2),'ro')

%% VI. 绘制迭代进化曲线
figure(2)
plot(trace(:,1),trace(:,3),'b:')
hold on
plot(trace(:,1),trace(:,2),'r-')
xlabel('Generation'); ylabel('Fittness');
legend('Mean Fitness', 'Best Fitness')
grid;
