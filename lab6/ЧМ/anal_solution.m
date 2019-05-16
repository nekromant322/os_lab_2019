function y = anal_solution(x, e)

inv_e = -1./e;

y = (1 - exp(inv_e .* x)) ./ (1 - exp(inv_e));
