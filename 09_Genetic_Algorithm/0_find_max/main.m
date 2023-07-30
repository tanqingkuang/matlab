% ���ܣ�ʹ���Ŵ��㷨����һԪ���������ֵ

%% I. ��ջ�������
clc
close all
addpath('../gaot') %��� gaot������
clear all

%% II. ���ƺ�������
x = 0:0.01:9;
y =  x + 10*sin(5*x)+7*cos(4*x);

figure
plot(x, y)
xlabel('�Ա���')
ylabel('�����')
title('y = x + 10*sin(5*x) + 7*cos(4*x)')
grid % �������

%% III. ��ʼ����Ⱥinitializega
initPop = initializega(50,[0 9],'fitness');    %��Ⱥ��С�������仯��Χ����Ӧ�Ⱥ���������
%��һ��initpop     �ڶ��д���   ��Ӧ�Ⱥ���ֵ

%% IV. �Ŵ��㷨�Ż�ga
[x endPop bpop trace] =... % [���Ÿ���, �Ż���ֹ��������Ⱥ, ������Ⱥ�Ľ����켣, ��������������]
    ga([0 9],... %������Χ���½�
    'fitness',[],... %��Ӧ�Ⱥ�������Ӧ�Ⱥ����Ĳ���
    initPop,[1e-6 1 1],... %��ʼ��Ⱥ�����Ⱥ���ʾ��ʽ
    'maxGenTerm',25,...% ��ֹ������������ֹ�����Ĳ���
    'normGeomSelect',0.08,...% ѡ���������ƣ�ѡ�����Ĳ���
    'arithXover',2,...% ���溯�������ƣ����溯���Ĳ���
    'nonUnifMutation',[2 25 3]); % ���캯�������ƣ����캯���Ĳ���

%% V. ������ŽⲢ�������ŵ�
x
hold on
plot (endPop(:,1),endPop(:,2),'ro')

%% VI. ���Ƶ�����������
figure(2)
plot(trace(:,1),trace(:,3),'b:')
hold on
plot(trace(:,1),trace(:,2),'r-')
xlabel('Generation'); ylabel('Fittness');
legend('Mean Fitness', 'Best Fitness')
grid;
