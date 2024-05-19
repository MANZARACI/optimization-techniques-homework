clear all
close all
clc

X1=-10:0.01:10;
X2=-10:0.01:10;
[x1,x2]=meshgrid(X1,X2);

F=0.25*x1.^4-0.5*x1.^2+0.1*x1+0.5*x2.^2;
realFMin=min(min(F))

mesh(x1,x2,F)
hold on
plot(-1.0465,0,'r.','MarkerSize',10)

first_x0=-10+20*rand(2,1);
second_x0=-10+20*rand(2,1);
third_x0=-10+20*rand(2,1);
epsilon=10^(-4);

%% Newton-Raphson Algorithm
nFirst_x0=first_x0;
nSecond_x0=second_x0;
nThird_x0=third_x0;

figure
contourf(x1,x2,F)
hold on

fprintf('Newton-Raphson Algorithm 1\n')
newtonRaphsonFunc(nFirst_x0,epsilon,'r')

fprintf('Newton-Raphson Algorithm 2\n')
newtonRaphsonFunc(nSecond_x0,epsilon,'g')

fprintf('Newton-Raphson Algorithm 3\n')
newtonRaphsonFunc(nThird_x0,epsilon,'y')

title('Newton-Raphson Algorithm')
set(gca,'fontsize',20)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

%% Hestenes-Stiefel Algorithm
hFirst_x0=first_x0;
hSecond_x0=second_x0;
hThird_x0=third_x0;

figure
contourf(x1,x2,F)
hold on

fprintf('Hestenes-Stiefel Algorithm 1\n')
hestenesStiefelFunc(hFirst_x0,epsilon,'r')

fprintf('Hestenes-Stiefel Algorithm 2\n')
hestenesStiefelFunc(hSecond_x0,epsilon,'g')

fprintf('Hestenes-Stiefel Algorithm 3\n')
hestenesStiefelFunc(hThird_x0,epsilon,'y')

title('Hestenes-Stiefel Algorithm')
set(gca,'fontsize',20)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

%% Polak-Ribière Algorithm
pFirst_x0=first_x0;
pSecond_x0=second_x0;
pThird_x0=third_x0;

figure
contourf(x1,x2,F)
hold on

fprintf('Polak-Ribière Algorithm 1\n')
polakRibiereFunc(pFirst_x0,epsilon,'r')

fprintf('Polak-Ribière Algorithm 2\n')
polakRibiereFunc(pSecond_x0,epsilon,'g')

fprintf('Polak-Ribière Algorithm 3\n')
polakRibiereFunc(pThird_x0,epsilon,'y')

title('Polak-Ribière Algorithm')
set(gca,'fontsize',20)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

%% Fletcher-Reeves Algorithm
fFirst_x0=first_x0;
fSecond_x0=second_x0;
fThird_x0=third_x0;

figure
contourf(x1,x2,F)
hold on

fprintf('Fletcher-Reeves Algorithm 1\n')
fletcherReevesFunc(fFirst_x0,epsilon,'r')

fprintf('Fletcher-Reeves Algorithm 2\n')
fletcherReevesFunc(fSecond_x0,epsilon,'g')

fprintf('Fletcher-Reeves Algorithm 3\n')
fletcherReevesFunc(fThird_x0,epsilon,'y')

title('Fletcher-Reeves Algorithm')
set(gca,'fontsize',20)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);