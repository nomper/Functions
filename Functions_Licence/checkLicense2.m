function checkLicense2()
fh = @checkLicense1;
memoizedFcn = memoize(fh);
memoizedFcn()
