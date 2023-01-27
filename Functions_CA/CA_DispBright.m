function ret = CA_DispBright(obj, val)
if(exist("val","var"))
    writeline(obj,":DISPlay:BRIGhtness "+ num2str(val))
end
% pause(1);
ret =str2double(query(obj, ":DISPlay:BRIGhtness?"));

end

