function [x, y] = loadRamanASCII(fullpath)
if(~exist(fullpath,'file'))
    return
end
A = readmatrix(fullpath);
[xx, yy] = size(A);
x = zeros(xx,yy/2);
y = x;
for r = 1:(yy/2)
    x(:,r) = A(:,2*r-1);
    y(:,r) = A(:,2*r);
end
end
