function xlimc(c,d)
if(~exist('c','var'))
    return
end
if(~exist('d','var'))
    return
end
d = abs(d);
xlim([c-d, c+d])
end
