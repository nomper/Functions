function print_tanaka2(figurehandle, mFilename, bgs, opti)
filename = sprintf("%s_fig%02d",mFilename, figurehandle.Number);
if(~exist("bgs","var"))
    bgs = false;
end
if(~exist("opti","var"))
    opti = false;
end
print_tanaka(figurehandle, filename, bgs, opti)