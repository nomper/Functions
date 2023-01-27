function obj = gpib_init()
% obj = gpib('ni',0,11,"EOSCharCode", 'LF', "EOSMode", 'read&write');
obj = visadev("GPIB0::11::INSTR");
% fopen(obj);
IDN = query(obj, "*IDN?");
fprintf(IDN+"\n");
end
