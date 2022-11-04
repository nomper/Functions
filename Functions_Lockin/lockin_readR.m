function R = lockin_readR(obj, N)
if(~exist("N","var"))
    N = 1;
end
Rt = zeros(1,N);
for n = 1:N
    Rt(n) = double(deblank(string(query(obj, 'OUTP?3'))));
end
R = mean(Rt);
end

