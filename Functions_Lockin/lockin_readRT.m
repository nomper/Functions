function [R, T] = lockin_readRT(obj, N)
if(~exist("N","var"))
    N = 1;
end
if(N == 1)
    R = double(string(query(obj, 'OUTP?3')));
    T = double(string(query(obj, 'OUTP?4')));
    return;
end

Rt = zeros(1,N);
Tt = zeros(1,N);

for n = 1:N
    Rt(n) = double(string(query(obj, 'OUTP?3')));
    Tt(n) = double(string(query(obj, 'OUTP?4')));
end
R = mean(Rt);
T = mean(Tt);

end

