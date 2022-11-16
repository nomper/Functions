function T = SetStatus_QCL(obj,on,TECT,curr)
%ReadV2100 keithly 2100 6 1/2から温度を読みます
%   詳細説明をここに記述
write(obj,sprintf("outp %d",on));
write(obj,sprintf("sour2:temp %dC",TECT));
write(obj,sprintf("sour1:curr %d",curr));
