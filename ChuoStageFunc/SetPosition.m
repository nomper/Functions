function res = SetPosition(s, x, y, z)
%SetPosition Set Position manually
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq
res = SerialSend(s, sprintf("R:A%dB%dC%d",x,y,z));
end