%% I. �������
clear all;
clc;
close all;

%% II. �趨����ϵͳ����
y0 = 0.15; %��ʼ����
wn = [sqrt(2); sqrt(3); sqrt(2); sqrt(3)]; % ��Ȼ(����)Ƶ��
zeta = [1/(2*sqrt(2)); 1/(2*sqrt(2)); 1/(2*sqrt(1)); 1/(2*sqrt(3))]; % ����ϵ��
wn_zeta = wn .* zeta;

%% III. ѡ��Աȷ���
t=[0:0.1:10];
compare = [1,2; 1,3; 1,4];
title_str = ['\omega_n���, \zeta����, \zeta\omega_n���',
    '\omega_n����, \zeta���, \zeta\omega_n���',
    '\omega_n���, \zeta��С, \zeta\omega_n����'];

%% IV. ֱ��ʹ�ý�����������������Ӧ
%%
% 1. ���������������Ӧ
c = y0./sqrt(1-zeta.*zeta);
y = zeros(4, 101); % ��������Ӧ�Ľ�����
y(1,:) = c(1)*exp(-wn_zeta(1)*t) .* sin(wn(1)*sqrt(1-zeta(1)^2)*t+acos(zeta(1)));
y(2,:) = c(2)*exp(-wn_zeta(2)*t) .* sin(wn(2)*sqrt(1-zeta(2)^2)*t+acos(zeta(2)));
y(3,:) = c(3)*exp(-wn_zeta(3)*t) .* sin(wn(3)*sqrt(1-zeta(3)^2)*t+acos(zeta(3)));
y(4,:) = c(4)*exp(-wn_zeta(4)*t) .* sin(wn(4)*sqrt(1-zeta(4)^2)*t+acos(zeta(4)));

%%
% 2. ���������
bu = zeros(4, 101);
bu(1,:) = c(1)*exp(-wn_zeta(1)*t);
bu(2,:) = c(2)*exp(-wn_zeta(2)*t);
bu(3,:) = c(3)*exp(-wn_zeta(3)*t);
bu(4,:) = c(4)*exp(-wn_zeta(4)*t);
bl = -bu;

%%
% 3. ��ͼ
for i=1:size(compare, 1)
    figure(i);
    hold on;
    plot(t,y(compare(i,1),:),'b-');
    plot(t,y(compare(i,2),:),'r-');
    plot(t,bu(compare(i,1),:),'b--', t,bl(compare(i,1),:),'b-.');
    plot(t,bu(compare(i,2),:),'r--', t,bl(compare(i,2),:),'r-.');
    xlabel('Time(s)')
    ylabel('y(t)(m)')
    legend(['\omega_n=', num2str(wn(compare(i,1)),'%.3f'),...
        ', \zeta=', num2str(zeta(compare(i,1)),'%.3f'),...
        ', \zeta\omega_n=', num2str(wn_zeta(compare(i,1)),'%.3f')],...
        ['\omega_n=', num2str(wn(compare(i,2)),'%.3f'),...
        ', \zeta=', num2str(zeta(compare(i,2)),'%.3f'),...
        ', \zeta\omega_n=', num2str(wn_zeta(compare(i,2)),'%.3f')])
    title(title_str(i,:))
    grid
end

%% V ����
%%
% 1. ��figure1���Կ�����wn�����ӿ��𵴣���Ҳ��wn��֮Ϊ����Ƶ�ʵ�ԭ��

%%
% 2. ��figure2���Կ�������zeta����ᵼ����ͬһ���������������ļӿ죬��Ҳ��zeta��֮Ϊ����ϵ����ԭ��

%%
% 3. ��figure3���Կ�����������wn��zeta��α仯��ֻҪzeta*wn���䣬��ôϵͳ��˥��Ч�ʾͲ���
% ������Ϊ��Ȼwn����µ�λʱ�����и�������ˣ����Ǹ���2��֪��zeta��С�ᵼ��ÿ���𵴵�˥����С
% �ۺ������͵��µ�λʱ���˥��Ч�ʾ�û�б仯�����zeta*wn������Ч��