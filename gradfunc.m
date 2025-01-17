function ypr = gradfunc(x)
    syms x1 x2
    F=0.25*x1^4-0.5*x1^2+0.1*x1+0.5*x2^2;
    g=gradient(F);
    ypr=double(subs(g,[x1 x2],[x(1) x(2)]));
end