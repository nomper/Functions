function Wavenumber = Wavelength2Wavenumber(Wavelength, WavelengthShift)
if(exist("WavelengthShift","var"))
    Wavenumber = 1e7./WavelengthShift - 1e7./Wavelength;
else
    Wavenumber = 1e7./Wavelength ;
end

end

