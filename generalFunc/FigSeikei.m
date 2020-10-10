function FigSeikei(f)
if(~exist("f","var"))
    f = gcf;
end
a = f.CurrentAxes;
f.Position(3) = 640;
f.Position(4) = 480;
if(f.Position(2)+480 > 1000)
    f.Position(2) = 1080 - 580;
end
% a.FontName = 'Arial';
a.FontName = 'Helvetica';
a.FontSize = 12;
try
    a.XColor = [0, 0, 0];
    a.XLabel.Color = [0, 0, 0];
catch
end

try
    a.YColor = [0, 0, 0];
    a.YLabel.Color = [0, 0, 0];
catch
end

try
    a.ZColor = [0, 0, 0];
    a.ZLabel.Color = [0, 0, 0];
catch
end

try
    a.RColor = [0, 0, 0];
    a.RLabel.Color = [0, 0, 0];
catch
end
try
    a.ThetaColor = [0, 0, 0]
    a.ThetaLabel.Color = [0, 0, 0]
catch
end

a.GridColor = [0, 0, 0];
a.Box = 'on';
end