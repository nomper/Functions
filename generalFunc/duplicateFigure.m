function fnew = duplicateFigure(fsource, fnew)
if(~exist("fsource","var"))
    fsource = gcf;
end

if(~exist("fnew","var"))
    fnew = figure();
else
    fnew = figure(fnew);
end
copyobj(fsource.CurrentAxes, fnew);
fnew.Position = fsource.Position + [30 -30 0 0];
end
