function [X, Y, R, T] = lockin_readXYRT(obj, N)
if(~exist("N","var"))
    N = 1;
end
Xt = zeros(1,N);
Yt = zeros(1,N);
Rt = zeros(1,N);
Tt = zeros(1,N);

for n = 1:N
    Xt(n) = double(deblank(string(query(obj, 'OUTP?1'))));
    Yt(n) = double(deblank(string(query(obj, 'OUTP?2'))));
    Rt(n) = double(deblank(string(query(obj, 'OUTP?3'))));
    Tt(n) = double(deblank(string(query(obj, 'OUTP?4'))));
end
X = mean(Xt);
Y = mean(Yt);
R = mean(Rt);
T = mean(Tt);

end

