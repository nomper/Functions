function MatrixFigure(figurenumbers, clearflag)
%MATRIXFIGURE Figureを整列する。
%   figurenumbersに数字の配列を入れる。
%   clearflag = trueでfigureを初期化。
if ~exist('clearflag', 'var')
    clearflag = false; 
end
for fn = 1:length(figurenumbers)
   f = figure(figurenumbers(fn));
   if(clearflag)
       clf(f);
   end
   x = ceil(fn/2) - 1;
   y = mod(fn, 2);
   
   f.Position(1) = -1920 + 640 * x;
   f.Position(2) = 520 * y;
end
end

