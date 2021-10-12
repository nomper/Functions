function print2clip(figurehandle)
%print_tanaka 普段使�?の�?括出�?
%   1にfigure handle, 2にファイルネ�?��?の頭, 3にbackground or not
%   png pdf(イラレ) figをコピ�?��?
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
print(figurehandle, "-clipboard","-dbitmap");

end

