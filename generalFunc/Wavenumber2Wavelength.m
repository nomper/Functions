function Wavelength = Wavenumber2Wavelength(Wavenumber, WavelengthShift)
if(~exist("WavelengthShift","var"))
    Wavelength = 1e7./Wavenumber ;
else
    
    Wn = 1e7./WavelengthShift - Wavenumber;
    Wavelength = 1e7./Wn ;
end

end

