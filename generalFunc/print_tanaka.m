function print_tanaka(figurehandle, filename)
%print_tanaka 普段使いの一括出力
%   1にfigure handle, 2にファイルネームの頭, 3にカットの有無
%   png pdf(イラレ) figをコピー、pngは端を切り落とす。
print(figurehandle, strcat(filename,'.png'), "-dpng", "-r250");
print(figurehandle, strcat(filename,'.pdf'), "-dpdf", "-painters");
savefig(figurehandle, strcat(filename, '.fig'), 'compact');

end

