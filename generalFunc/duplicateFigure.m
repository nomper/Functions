function duplicateFigure(f)
if(~exist("f","var"))
    f = gcf;
end
fnew = figure();
copyobj(f.CurrentAxes, fnew);
fnew.Position = f.Position + [30 -30 0 0];
end
