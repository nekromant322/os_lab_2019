clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% настройки
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
epsilon		= 0.1;
method		= 'left';	% possible values: 'right', 'left', 'center'
h			= 0.01;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% генерация сетки
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = 0: h : 1;
N = length(x);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% определение коэффициентов и значений функции
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (strcmp('right', method))
	a = epsilon;
	b = 2*epsilon + h;
	c = epsilon + h;
elseif (strcmp('left', method))
	a = epsilon - h;
	b = 2*epsilon - h;
	c = epsilon;
elseif (strcmp('center', method))
	a = 2*epsilon - h;
	b = 4*epsilon;
	c = 2*epsilon + h;
end

a = ones(1, N) * a;
b = -ones(1, N) * b;
c = ones(1, N) * c;
b(1) = 1; c(1) = 0;
a(N) = 0; b(N) = 1;

f = 0;
f(N) = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% решение системы
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on;
grid on;

y = screw_die2(a, b, c, f, N);
plot(x, y, 'r');

ay = anal_solution(x, epsilon);
plot(x, ay, 'b');

legend('Screw die', 'analytic solution');

dy = find_dnorm(y, ay, 'simple');
qdy = find_dnorm(y, ay, 'quad');
ady = find_dnorm(y, ay, 'avrg');
disp(sprintf('Norm diff: %f', max(dy)));
disp(sprintf('Norm diff quad: %f', max(qdy)));
disp(sprintf('Norm diff avrg: %f', ady));
