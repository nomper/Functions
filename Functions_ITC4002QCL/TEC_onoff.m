function TEC_onoff(obj,on)
%ReadV2100 keithly 2100 6 1/2から温度を読みます
%   詳細説明をここに記述
write(obj,sprintf("outp2 %d",on));
