function f = setboxlong(f)
%SETBOXLONG 1280x480�ɕύX
%   ������figure handle
if(~exist("f","var"))
    f = gcf;
end
f.Position(3) = 1280;
f.Position(4) = 480;
end

