function print_tanaka(figurehandle, filename, bgs, opti)
%print_tanaka 普段使いの一括出力
%   1にfigure handle, 2にファイルネームの頭, 3にbackground or not
%   png pdf(イラレ) figをコピー、
if(~ishandle(figurehandle))
    if(isnumeric(figurehandle))
        figurehandle = figure(figurehandle);
    end
end
if ~exist("bgs","var")
    bgs = false;
end
if ~exist("opti","var")
    opti = false;
end

if(bgs)
    p = gcp;
    F(1) = parfeval(p, @print, 0, figurehandle, strcat(filename,'.png'), "-dpng", "-r250");
    F(2) = parfeval(p, @print, 0, figurehandle, strcat(filename,'.pdf'), "-dpdf", "-painters");
    F(3) = parfeval(p, @savefig, 0, figurehandle, strcat(filename, '.fig'), 'compact');
    if(opti)
        wait(F);
        comm = sprintf("!oxipng.exe %s -p -o max", strcat(filename,'.png'));
        parfeval(p, @eval, 0, comm);
    end
else
    print(figurehandle, strcat(filename,'.png'), "-dpng", "-r250");
    print(figurehandle, strcat(filename,'.pdf'), "-dpdf", "-painters", "-bestfit");
    savefig(figurehandle, strcat(filename, '.fig'), 'compact');
end
if(opti)
    eval(sprintf("!oxipng.exe %s -p -o max", strcat(filename,'.png')))
end

end

