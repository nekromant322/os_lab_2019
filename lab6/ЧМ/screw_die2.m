function y = screw_die2(a, b, c, f, N)

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


% searching for p and q
p(1) = c(1) / b(1);
q(1) = f(1) / b(1);
for i = 2 : N
	if (length(a) == 1)	ai = a; else ai = a(i);	end
	if (length(b) == 1)	bi = b; else bi = b(i);	end
	if (length(c) == 1)	ci = c; else ci = c(i);	end
	if (length(f) == 1)	fi = f; else fi = f(i);	end
	
	p(i) = ci / (bi - p(i-1)*ai);
	q(i) = (fi - q(i-1)*ai) / (bi - p(i-1)*ai);
end


% calculating y
y(N) = q(N);
for i = N-1 : -1 : 1
	y(i) = q(i) - p(i)*y(i+1);
end

y = y';