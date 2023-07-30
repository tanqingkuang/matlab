%%  I �����������
clear all
close all
clc

%% II mapminmaxѧϰ
%%
% 1. ��һ��
X = [
    1 1.5 2;
    3 3.5 5; 
    5  6  8;
    ];
[Y, setting] = mapminmax(X, 0, 1) % ��X��ÿһ�а���[0,1]���й�һ�������ΪY��������һ���̴���setting

%%
% 2. ��һ����apply
testData = [1;4.5;7];
y = mapminmax('apply', testData, setting) % ����֮ǰ��setting��testData���й�һ�������Ϊy

%%
% 3. �����һ
mapminmax('reverse', Y, setting) % ����֮ǰ��setting��Y���л��ˣ���˽��Ӧ��X���

%% III ������ѧϰ
%%
% 1. ����BP������
net = newff(X, Y, 4); % p_trainΪ���룬t_trainΪ�����9���ڵ���Ϊ������
view(net)

%%
% 2. ���������
%%
% 2.1 ���ò���
net.trainParam.epochs = 1000; % ����������1000��
net.trainParam.goal = 1e-4; % ����Ŀ�꣬���С�ڸ�ֵ�Ȼ�ֹͣ
net.trainParam.lr = 0.01; % ѧϰ��
%%
% 2.2 �Զ�����
net.numLayers % 2�㣺1�������� + 1�������
net.numWeightElements % 31������Ȩ�� = (3input + 1b)*4������ + (4������ + 1b)*3output
net.IW; % ����㵽�������Ȩ��
net.LW; % �����㵽������Ȩ��
net.b; % ��ֵ
net.performFcn % ���ܺ�����ʹ�þ��������ܺ���
net.trainFcn % ѵ������:

%%
% 3. ѵ��������
net = train(net, X, Y);

%%
% 4. ģ�����
t_sim = sim(net, X) % ���Կ�����Y����
