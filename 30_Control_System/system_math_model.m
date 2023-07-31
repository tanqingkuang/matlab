clear all;clc;close all;

%% I 多项式
%%
% 1. 多项式与根
p=[1 3 0 4];
r=roots(p) % 求解p(s)=0的根
p=poly(r) % 根据p(s)=0的根反推多项式

%%
% 2. 多项式相乘
p=[3 2 1];q=[1 4];
n=conv(p, q) % 多项式相乘
value = polyval(n,-5) % 多项式在-5时的值

%% II 传递函数
%%
% 1.创建传递函数
num1=[1 10]; den1=[1 2 1];
sys1=tf(num1, den1) % 创建传递函数

%%
% 2.传递函数连接
num2=[1]; den2=[1 10];
sys2=tf(num2, den2);
sys_add = sys1 + sys2 % 两个传递函数求和，还有一种表示parallel(sys1, sys2)
sys_mul = sys1 * sys2 % 两个传递函数相乘，还有一种表示series(sys1, sys2)
sys_fb = feedback(sys1, sys2, -1) % sys2作为负反馈
sys_mul_real = minreal(sys_mul) % 消除公因式

%%
% 3.零点 & 极点
p = pole(sys1) % 传递函数计算极点
z = zero(sys1) % 传递函数计算零点
% 传递函数同时计算极点和零点[p, z] = pzmap(sys1)

%% III 响应
%%
% 1. 阶跃响应
t=[0:0.01:8];
[y,t] = step(sys_fb, t); % 阶跃响应
plot(t,y), grid

%%
% 2. 脉冲响应
t=[0:0.01:8];
[y,t] = impulse(sys_fb, t); % 脉冲响应
plot(t,y), grid