function f = setboxlong(f)
%SETBOXLONG 1280x480に変更
%   引数はfigure handle
if(~exist("f","var"))
    f = gcf;
end
f.Position(3) = 1280;
f.Position(4) = 480;
end

