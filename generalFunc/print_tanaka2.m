function print_tanaka2(figurehandle, mFilename, bgs)
filename = sprintf("%s_fig%02d",mFilename, figurehandle.Number);
if(~exist("bgs","var"))
    bgs = false;
end
print_tanaka(figurehandle, filename, bgs)