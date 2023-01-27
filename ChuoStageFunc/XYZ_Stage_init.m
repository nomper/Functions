function s = XYZ_Stage_init(ResetFlag)

%% Pre- Serial Initializing 
serial('COM30');
temp=instrfind();
for a=1:length(temp)
    fclose(temp(1,a));
    delete(temp(1,a));
end

%% start / Serial Initializing
s = serialport('COM3',38400,'StopBits',1,Timeout=1);
configureTerminator(s,'CR/LF');

% set(s,'BaudRate',38400);
% set(s,'DataBit',8);
% set(s,'StopBits',1);
% set(s,'Terminator','CR/LF');
fopen(s);

SerialSend(s,'?')
if(exist("ResetFlag","var"))
    if(ResetFlag)
        SerialSend(s,'RESTA:');
        pause(10);
    end
end

SerialSend(s,'X:1');
SerialSend(s,'X:R');
SerialSend(s,'P:04A36B36C31');
SerialSend(s,'P:53,0,0,0,0');
SerialSend(s,'F:');
SerialSend(s,"R:A0");
SerialSend(s,"R:B0");
SerialSend(s,"R:C0");
pause(0.5);

SerialSend(s,'S:A07B07C06');

SerialSend(s,'D:A0010P0020P2000')
SerialSend(s,'D:B0010P0020P2000')
SerialSend(s,'D:C1000P4000P1000')

% SerialSend(s,'D:A1000P2000P2000')
% SerialSend(s,'D:B1000P2000P2000')
% SerialSend(s,'D:C1000P4000P1000')

SerialSend(s,'F:')
% SerialSend(s,'H:ABC');

flush(s);

end 