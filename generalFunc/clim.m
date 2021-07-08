function c = clim(m, M)
g = gcf;
ax = g.CurrentAxes;
c = [];
if(~exist("m","var"))
    return;
elseif(~exist("M","var"))
    if(length(m)==2)
        M = m(2);
        m = m(1);
    else
        return
    end
end

try
    if(~isempty(m))
        ax.CLim(1) = m;
    end
    if(~isempty(M))
        ax.CLim(2) = M;
    end
    c = ax.CLim;
catch ME
    ME.message
    c = [];
end

end

