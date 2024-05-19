function newtonRaphsonFunc(x, epsilon, color)
    tic
    fprintf('k=1, x1=%f, x2=%f, f(x)=%f\n',x(1),x(2),func(x))
    plot(x(1),x(2),strcat(color,'.'))
    
    x_next=x-inv(hessianfunc(x))*gradfunc(x);

    fprintf('k=2, x1=%f, x2=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),func(x_next),abs(func(x_next)-func(x)))
    plot(x_next(1),x_next(2),strcat(color,'*'))
    
    k=3;
    while(abs(func(x_next)-func(x))>epsilon)
        x=x_next;
        x_next=x-inv(hessianfunc(x))*gradfunc(x);
        fprintf('k=%d, x1=%f, x2=%f, f(x)=%f, abs. error=%f\n',k,x_next(1),x_next(2),func(x_next),abs(func(x_next)-func(x)))
        plot(x_next(1),x_next(2),strcat(color,'*'))
        k=k+1;
    end
    toc
    fprintf('\n')
end