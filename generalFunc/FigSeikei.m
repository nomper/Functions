function f = FigSeikei(f)
if(~exist("f","var"))
    f = gcf;
end
coeff = (ispc + 1.5 * ismac);
f.Position(3) = 640 * coeff;
f.Position(4) = 480 * coeff;
for a = f.Children'
    if(f.Position(2) + 480 > 1000)
        f.Position(2) = 1080 - 580;
    end
    if(sum(contains(listfonts,"Helvetica"))==0)
        a.FontName = 'Arial';
    else
        a.FontName = 'Helvetica';
    end
    a.FontSize = 12 * coeff;
    try
        a.XColor = [0, 0, 0];
        a.XLabel.Color = [0, 0, 0];
        a.XMinorTick = 'on';
    catch
    end
    
    try
        a.YColor = [0, 0, 0];
        a.YLabel.Color = [0, 0, 0];
        a.YMinorTick = 'on';
    catch
    end
    
    try
        a.ZColor = [0, 0, 0];
        a.ZLabel.Color = [0, 0, 0];
        a.ZMinorTick = 'on';
    catch
    end
    
    try
        a.RColor = [0, 0, 0];
        a.RLabel.Color = [0, 0, 0];
        a.RMinorTick = 'on';
    catch
    end
    try
        a.ThetaColor = [0, 0, 0];
        a.ThetaLabel.Color = [0, 0, 0];
        a.ThetaMinorTick = 'on';
    catch
    end
    try
    a.GridColor = [0, 0, 0];
    catch
    end
    a.Box = 'on';
end
end