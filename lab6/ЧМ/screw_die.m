function y = screw_die(b, c, a, f, N, m1, x1, m2, x2)

% run-time checks
y = 0;
if (length(f) ~= N & 1 ~= length(f))
	error('Size of [f] = %d and not equal to N = %d', length(f), N);
	return;
end
if (length(a) ~= N & 1 ~= length(a))
	error('Size of [a] = %d and not equal to N = %d', length(a), N);
	return;
end
if (length(b) ~= N & 1 ~= length(b))
	error('Size of [b] = %d and not equal to N = %d', length(b), N);
	return;
end
if (length(c) ~= N & 1 ~= length(c))
	error('Size of [c] = %d and not equal to N = %d', length(c), N);
	return;
end


% searching for alpha and beta
alpha(1)	= x1;
beta(1)		= m1;

for i = 1 : N-1
	if (length(a) == 1)	ai = a; else ai = a(i);	end
	if (length(b) == 1)	bi = b; else bi = b(i);	end
	if (length(c) == 1)	ci = c; else ci = c(i);	end
	if (length(f) == 1)	fi = f; else fi = f(i);	end
	
	h = ci - alpha(i) * ai;
	alpha(i+1) = bi / h;
	beta(i+1) = (fi + beta(i)*ai) / h;
end


% calculating y
y(N) = (m2 + x2 * beta(N)) / (1 - x2 * alpha(N));

for i = N : -1 : 2
	y(i-1) = alpha(i) * y(i) + beta(i);
end
