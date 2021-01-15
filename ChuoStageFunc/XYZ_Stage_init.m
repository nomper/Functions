function s = XYZ_Stage_init()

%% Pre- Serial Initializing 
serial('COM30');
temp=instrfind();
for a=1:length(temp)
    fclose(temp(1,a));
    delete(temp(1,a));
end

%% start / Serial Initializing
s = serial('COM4');
set(s,'BaudRate',38400);
set(s,'DataBit',8);
set(s,'StopBits',1);
set(s,'Terminator','CR/LF');
fopen(s);

SerialSend(s,'?')
SerialSend(s,'RESTA:');
pause(10);

SerialSend(s,'X:1');
SerialSend(s,'X:R');
SerialSend(s,'P:04A36B36C31')
SerialSend(s,'P:53,0,0,0,0')
SerialSend(s,'F:')
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

flushinput(s);

end 