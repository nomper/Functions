function obj1 = init2100()
%INIT2100 keithly 2100 6 1/2のイニシャライズ
%   細かいUSBidは自分で書き換える必要があります。
obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x05E6::0x2100::8016412::0::INSTR', 'Tag', '');

% Create the VISA-USB object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = visa('NI', 'USB0::0x05E6::0x2100::8016412::0::INSTR');
else
    fclose(obj1);
    obj1 = obj1(1);
end

% Connect to instrument object, obj1.
fopen(obj1);

end

