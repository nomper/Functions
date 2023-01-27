function obj1 = init_CA()
%INITQCL Thorlabs ITC4002QCL のイニシャライズ
%   細かいUSBidは自分で書き換える必要があります。

% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x1313::0x804A::M00621450::0::INSTR', 'Tag', '');
% objL = visadevlist();
% for n = 1:size(objL,1)
%     if(objL(n,4).Model == "ITC4002QCL")
%         obj1 = objL(n,:);
%     end
% end 
% Create the VISA-USB object if it does not exist
% otherwise use the object that was found.

% if isempty(obj1)
%     obj1 = visadev('USB0::0x1313::0x804A::M00621450::0::INSTR');
% else
%     fclose(obj1);
%     obj1 = obj1(1);
% end
    obj1 = visadev('ASRL4::INSTR');

% Connect to instrument object, obj1.
try
    fopen(obj1);
catch
    fclose(obj1)
    fopen(obj1)
end
writeread(obj1, "*IDN?")
end

