function hestenesStiefelFunc(x, epsilon, color)
    tic
    fprintf('k=1, x1=%f, x2=%f, f(x)=%f\n',x(1),x(2),func(x))
    plot(x(1),x(2),strcat(color,'.'))

    g=gradfunc(x);
    d=-g;
    
    %alpha argmin procedure
    alpha=0:0.01:1;
    funcalpha=zeros(length(alpha),1);
    for i=1:length(alpha)
        funcalpha(i)=func(x+alpha(i)*d);
    end
    [val,ind]=min(funcalpha);
    alpha=alpha(ind);
    % end of alpha argmin procedure

    x_next=x+alpha*d;
    g_next=gradfunc(x_next);
    beta=(g_next'*(g_next-g))/(d'*(g_next-g));
    d_next=-g_next+beta*d;
    
    fprintf('k=2, x1=%f, x2=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),func(x_next),abs(func(x_next)-func(x)))
    plot(x_next(1),x_next(2),strcat(color,'*'))

    k=3;
    while(abs(func(x_next)-func(x))>epsilon)
        x=x_next;
        g=g_next;
        d=d_next;
    
        %alpha argmin procedure
        alpha=0:0.01:1;
        funcalpha=zeros(length(alpha),1);
        for i=1:length(alpha)
            funcalpha(i)=func(x+alpha(i)*d);
        end
        [val,ind]=min(funcalpha);
        alpha=alpha(ind);
        % end of alpha argmin procedure
    
        x_next=x+alpha*d;
        g_next=gradfunc(x_next);
        beta=(g_next'*(g_next-g))/(d'*(g_next-g));
        d_next=-g_next+beta*d;
    
        fprintf('k=%d, x1=%f, x2=%f, f(x)=%f, abs. error=%f\n',k,x_next(1),x_next(2),func(x_next),abs(func(x_next)-func(x)))
        plot(x_next(1),x_next(2),strcat(color,'*'))

        k=k+1;
    end
    toc
    fprintf('\n')
end