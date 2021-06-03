function Wavelength = Energy2Wavelength(Energy)
PC = PhysicalConst;
Wavelength = PC.hcbe ./ Energy;

end

