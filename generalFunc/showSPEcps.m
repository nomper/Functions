function f = showSPEcps(filename, f, flag)
if(~exist('f','var'))
    f = figure();
end
if(~exist('flag','var'))
    flag = true;
end
if(~ishandle(f))
    f = figure(f);
end
[y, x, param] = loadSPE(filename);
y = mean(y,3);
y2 = y./param.exp_sec;
y2 = mean(y2, 3);
x2 = mean(x, 3);
if(flag)
   y2 = y2(:,2) - y2(:,1);
end
set(groot, "CurrentFigure", f);
plot(x2, y2);
xlabel("Wavelength (nm)");
ylabel("Intensity (cps)");
title(filehead(filename),"Interpreter","none");
axis tight
FigSeikei()
end
