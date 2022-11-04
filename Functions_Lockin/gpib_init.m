function obj = gpib_init()
obj = gpib('ni',0,11,"EOSCharCode", 'LF', "EOSMode", 'read&write');
fopen(obj);
IDN = query(obj, "*IDN?")
end
