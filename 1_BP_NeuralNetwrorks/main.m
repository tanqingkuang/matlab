%% I.��ջ�������
clear all
clc

%% II.ѵ�����Ͳ��Լ��Ĳ���
%%
% 1. ��������
load spectra_data.mat

%% 
% 2.�������ѵ�����Ͳ��Լ�
temp = randperm(size(NIR, 1));
% ѵ���� ���� 80%��Ϊ����
M = size(NIR, 1) * 0.8;
P_train = NIR(temp(1:M),:)';
I_train = octane(temp(1:M),:)';
% ���Լ� ���� 20%��Ϊ����
P_test = NIR(temp(M+1:end),:)';
I_test = octane(temp(M+1:end),:)';
N = size(P_test, 2);

%% III. ���ݹ�һ��
[p_train, ps_input] = mapminmax(P_train, 0, 1);
p_test = mapminmax('apply', P_test, ps_input);

[t_train, ps_output] =  mapminmax(I_train, 0, 1);

%% IV. BP�����紴����ѵ�����������
%%
% 1. ��������
net = newff(p_train, t_train, 9);
% view(net)

%% 
% 2. ����ѵ������
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-4;
net.trainParam.lr = 0.01;

%%
% 3. ѵ������
net = train(net, p_train, t_train);

%%
% 4. �������
t_sim = sim(net, p_test);

%%
% 5. ���ݷ���һ��
I_sim = mapminmax('reverse', t_sim, ps_output);

%% V. ��������
error = abs(I_sim - I_test)./I_test;
result = [I_test', I_sim', error']

%% VI. ��ͼ
figure
plot(1:N, I_test, 'b:*', 1:N, I_sim, 'r-o')

