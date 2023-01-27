function c = clim(m, M)
g = gcf;
ax = g.CurrentAxes;
c = [];
if(~exist("m","var"))
        c = ax.CLim;
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
    if(~isempty([m,M]))
        ax.CLim = [m, M];
    elseif(~isempty(m))
        ax.CLim(1) = m;
    elseif(~isempty(M))
        ax.CLim(2) = M;
    end
    c = ax.CLim;
catch ME
    ME.message
    c = [];
end

end

