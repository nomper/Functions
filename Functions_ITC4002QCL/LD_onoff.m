function LD_onoff(obj,on)
%ReadV2100 keithly 2100 6 1/2から温度を読みます
%   詳細説明をここに記述
if(on)
    write(obj,sprintf("outp2 %d",on));
end
write(obj,sprintf("outp1 %d",on));
