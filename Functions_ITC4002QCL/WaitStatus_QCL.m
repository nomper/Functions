function [T C] = WaitStatus_QCL(obj,TECT,curr)
%ReadV2100 keithly 2100 6 1/2から温度を読みます
%   詳細説明をここに記述
IsLDon = str2double(writeread(obj,"outp1?"));
IsTECon = str2double(writeread(obj,"outp2?"));
T = 0; C = 0;
if((IsLDon + IsTECon) <2)
    return
end
t_tar = round(TECT,1);
c_tar = round(curr,2);
while(true)
    flag = 0;
    for n = 1:10
        T(n) = ReadT_QCL(obj,1);
        C(n) = ReadC_QCL(obj,2);
        pause(0.1);
    end
    if(max(T) == t_tar)
        if(min(T) == t_tar)
            flag = flag + 1;
        end
    end
    if(max(C) == c_tar)
        if(min(C) == c_tar)
            flag = flag + 1;
        end
    end
    if(flag == 2)
        break;
    end
end

