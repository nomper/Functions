function ax = tickboth(ax)
if(~exist("ax","var"))
    ax = gca;
end
ax.TickDir = "both";
end