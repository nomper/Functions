function t = tcp_init(chk_id_flag)
if(~exist("chk_id_flag","var"))
    chk_id_flag = true;
end

insts = instrfind;

for inst = insts
    if(strcmp(inst.class, 'tcpip'))
        fclose(inst);
        delete(inst);
    end
end
t = tcpip('169.254.0.1', 5025);
set(t, 'InputBufferSize', 30000);
fopen(t);
pause(0.5)
if(chk_id_flag)
    fprintf(t, '*IDN?');
    pause(0.5)
    
    while (get(t, 'BytesAvailable') > 0)
        t.BytesAvailable
        DataReceived = fscanf(t)
    end
end