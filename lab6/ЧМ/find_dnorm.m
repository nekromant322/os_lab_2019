function y = find_dnorm(a, b, method)

y = 0;
N = length(a);
if (length(b) ~= N)
	error('Size of [a] = %d and not equal to size of [b] = %d', length(a), length(a));
	return;
end

if (strcmp('quad', method))
	for i = 1 : N
		y(i) = (a(i) - b(i)) ^ 2;
	end
	y = sum(y) ^ (1/N);
elseif (strcmp('avrg', method))
	for i = 1 : N
		y(i) = abs(a(i) - b(i));
	end
	y = sum(y)/N;
else
	for i = 1 : N
		y(i) = abs(a(i) - b(i));
	end
end