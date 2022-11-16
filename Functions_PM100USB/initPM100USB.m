function obj1 = initPM100USB()
%INITPM100USB この関数の概要をここに記述
%   詳細説明をここに記述
obj1 = visadev('USB0::0x1313::0x8072::1903130::0::INSTR');
write(obj1, "corr:pow")
SetRangeAuto(obj1,true)
writeread(obj1, "conf?")
writeread(obj1,"corr:wav?")
% fopen(obj1);

end

