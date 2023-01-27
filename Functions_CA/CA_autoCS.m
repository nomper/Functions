function curr = CA_autoCS(obj)

writeline(obj,':INPut:BIAS:CURRent:AUTO exec');
pause(1)
curr = str2double(query(obj,':INPut:BIAS:CURRent?'));

end