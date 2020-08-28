function [outputArg1] = SetEachPort(s)

outputArg1 = '';

    for i = 1:2
        set(s(1,i),'BaudRate',9600);
        set(s(1,i),'DataBit',8);
        set(s(1,i),'StopBits',1);
        set(s(1,i),'Terminator','CR/LF');
    end

end

