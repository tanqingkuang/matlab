%% I.清空环境变量
clear all
clc

%% II.训练集和测试集的产生
%%
% 1. 导入数据
load spectra_data.mat

%% 
% 2.随机产生训练集和测试集
temp = randperm(size(NIR, 1));
% 训练集 —— 80%作为样本
M = size(NIR, 1) * 0.8;
P_train = NIR(temp(1:M),:)';
I_train = octane(temp(1:M),:)';
% 测试集 —— 20%作为测试
P_test = NIR(temp(M+1:end),:)';
I_test = octane(temp(M+1:end),:)';
N = size(P_test, 2);

%% III. 数据归一化
[p_train, ps_input] = mapminmax(P_train, 0, 1);
p_test = mapminmax('apply', P_test, ps_input);

[t_train, ps_output] =  mapminmax(I_train, 0, 1);

%% IV. BP神经网络创建、训练及仿真测试
%%
% 1. 创建网络
net = newff(p_train, t_train, 9);
% view(net)

%% 
% 2. 设置训练参数
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-4;
net.trainParam.lr = 0.01;

%%
% 3. 训练函数
net = train(net, p_train, t_train);

%%
% 4. 仿真测试
t_sim = sim(net, p_test);

%%
% 5. 数据反归一化
I_sim = mapminmax('reverse', t_sim, ps_output);

%% V. 性能评价
error = abs(I_sim - I_test)./I_test;
result = [I_test', I_sim', error']

%% VI. 绘图
figure
plot(1:N, I_test, 'b:*', 1:N, I_sim, 'r-o')

