function f = showSPEcpsRaman(filename, f, flag)
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
x2 = Wavelength2Wavenumber(x,532);
y2 = y./param.exp_sec;
y2 = mean(y2, 3);
y2 = hampel(y2);
x2 = mean(x2, 3);
y2 = y2(:,2) - y2(:,1);

set(groot, "CurrentFigure", f);
plot(x2, y2);
xlabel("Raman Shift from 532nm (cm^{-1})");
ylabel("Intensity (cps)");
title(filehead(filename),"Interpreter","none");
axis tight
FigSeikei(f);
ytickformat("%02.1f");
end
