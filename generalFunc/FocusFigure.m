function fr = FocusFigure(f)
flag = false;

if(length(f) == 1 )
    if(ishandle(f))
        flag = true;
    elseif(isnumeric(f))
        flag = true;
    end
end

if(flag)
    set(groot, 'CurrentFigure',f)
end
fr = gcf;
end

