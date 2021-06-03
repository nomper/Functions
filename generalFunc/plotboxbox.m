function ax = plotboxbox(ax, boxsize)
if(~exist("ax","var"))
    ax = gca;
end

if(~exist("boxsize","var"))
    boxsize = [1 1 1];
end
ax.PlotBoxAspectRatio = boxsize;
end