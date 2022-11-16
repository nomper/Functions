function sRot = RotStageInit()
%RotStageInit To Initialize Rotstage
%
%% Instrument Connection

% Find a serial port object.
sRot = instrfind('Type', 'serial', 'Port', 'COM5', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(sRot)
    sRot = serial('COM5');
else
    fclose(sRot);
    sRot = sRot(1);
end
fopen(sRot);

% Communicating with instrument object, obj1.

% Configure instrument object, obj1.
set(sRot, 'Terminator', {'CR/LF','CR/LF'});
set(sRot, 'BaudRate', 9600);

return;

data1 = query(sRot, 'H:1');
pause(0.1);
data2 = query(sRot, 'D:1S500F20000R5000')
pause(1);
% data2 = query(obj1, 'M:1+P1000');
query(sRot, '!:')
while(true)
    if(~contains(query(sRot, '!:'),'B'))
        break;
    end
    pause(0.1);
end
deg = 0:60:360;
for c = 1:length(deg)
    cdeg = deg(c);
    data3(c) = string(query(sRot, sprintf('A:1+P%4d',cdeg*200)));
    pause(0.1);
    data4(c) = string(query(sRot, 'G:'));
    pause(0.1);
    while(true)
        if(~contains(query(sRot, '!:'),'B'))
            break;
        end
        pause(1);
    end
end

end

