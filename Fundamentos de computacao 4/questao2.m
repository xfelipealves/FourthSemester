% ajuste de uma função a dados experimentais
% método dos mínimos desvios quadrados
%
% ajuste linear usando 3 metodos diferentes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;
% dados
X = [-1;0;1;2;3;4;5;6];
Y = [10;9;7;5;4;3;0;-1];
 N = length(X);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%subplot(3,1,1)
 scatter(X,Y);
 xlabel('x'); ylabel('f(x)');
 xlim([-1  7]); ylim([ -2 12 ]);
 hold on;
 grid on;
 a = ( N*sum(X.*Y) - sum(X) * sum(Y) ) / ( N*sum(X.^2) - (sum(X) )^2 );
 b = ( sum(Y) - a * sum(X) ) / N;
 % recta obtida
 Ymod1 = a * X + b;
 %erros
 S_1 = sqrt( sum( (Y - Ymod1 ).^2 ) / ( N - 2 ) );
 ErroA_1 = S_1 * sqrt( N / ( ( N * sum(X.^2) ) - ( sum(X) )^2) );
 ErroB_1 = S_1 * sqrt( sum(X.^2) / ( ( N * sum(X.^2) ) - ( sum(X) )^2) );
 plot(X,Ymod1);
plot(X,Y);
a
b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%