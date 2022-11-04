function instrReset()
s  = serial("com30");
ss = instrfind();
for s = ss
    if(s.Status == "open")
        fclose(s)
    end
    delete(s)
end
end

