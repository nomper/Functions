function fr = FocusFigure(f)
flag = false;

if(length(f) == 1 )
    if(isnumeric(f))
        flag = true;
    elseif(ishandle(f))
        if(~isvalid(f))
            f = figure();
        end
        flag = true;
    end
end

if(flag)
    set(groot, 'CurrentFigure',f)
end
fr = gcf;
end

