function copyFileAndOpen(sourceFilename, targetFilename)
%UNTITLED2 copy and open
%   source, target
if(exist("sourceFilename","var"))
    if(exist("targetFilename","var"))
        copyfile(sourceFilename, targetFilename);
        open(targetFilename);
    end
end
end

