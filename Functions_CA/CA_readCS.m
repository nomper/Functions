function curr = CA_readCS(obj)

curr = str2double(query(obj,':INPut:BIAS:CURRent?'));

end