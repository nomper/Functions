function res = SetPosOrig(s)
%SetPosition Set Position manually
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq
    res = SerialSend(s, sprintf("R:A%dB%dC%d", 0, 0, 0));
end