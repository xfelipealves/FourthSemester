
    % x0 - vector containing inputs (x values)
    % y0 - vector containing outputs (results for these x values
    % x - value you want to compute, for interpolation
    % y - computed value3
    
    x0 = [.7;1.2;1.3;1.5;2;2.3;2.6];
    y0 = [.043;1.928;2.497;3.875;9;13.467;19.176];
    x = 1.4;
    n = size(x0, 1); 
    y = 0;
    for i=1:n
        p = 1;
        for j=1:n
            if j == i   % avoiding fancy division by 0
                continue;
            endif;
            p *= (x-x0(j)) / (x0(i)-x0(j));
        endfor;
        y += y0(i) * p;   
    endfor;
    y