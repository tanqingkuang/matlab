clear all;clc;close all;

%% I ����ʽ
%%
% 1. ����ʽ���
p=[1 3 0 4];
r=roots(p) % ���p(s)=0�ĸ�
p=poly(r) % ����p(s)=0�ĸ����ƶ���ʽ

%%
% 2. ����ʽ���
p=[3 2 1];q=[1 4];
n=conv(p, q) % ����ʽ���
value = polyval(n,-5) % ����ʽ��-5ʱ��ֵ

%% II ���ݺ���
%%
% 1.�������ݺ���
num1=[1 10]; den1=[1 2 1];
sys1=tf(num1, den1) % �������ݺ���

%%
% 2.���ݺ�������
num2=[1]; den2=[1 10];
sys2=tf(num2, den2);
sys_add = sys1 + sys2 % �������ݺ�����ͣ�����һ�ֱ�ʾparallel(sys1, sys2)
sys_mul = sys1 * sys2 % �������ݺ�����ˣ�����һ�ֱ�ʾseries(sys1, sys2)
sys_fb = feedback(sys1, sys2, -1) % sys2��Ϊ������
sys_mul_real = minreal(sys_mul) % ��������ʽ

%%
% 3.��� & ����
p = pole(sys1) % ���ݺ������㼫��
z = zero(sys1) % ���ݺ����������
% ���ݺ���ͬʱ���㼫������[p, z] = pzmap(sys1)

%% III ��Ӧ
%%
% 1. ��Ծ��Ӧ
t=[0:0.01:8];
[y,t] = step(sys_fb, t); % ��Ծ��Ӧ
plot(t,y), grid

%%
% 2. ������Ӧ
t=[0:0.01:8];
[y,t] = impulse(sys_fb, t); % ������Ӧ
plot(t,y), grid