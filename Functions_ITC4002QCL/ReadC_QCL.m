function T = ReadC_QCL(obj,fnum)
%ReadV2100 keithly 2100 6 1/2から温度を読みます
%   詳細説明をここに記述
T0 = str2double(writeread(obj, "meas:curr?"));
if(exist("fnum","var"))
    T = round(T0,fnum);
else
    T = round(T0,1);
end

end