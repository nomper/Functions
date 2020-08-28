%% set 
instrfind()
seriallist()

% oneAx = serial("COM4");
% twoAx=serial('COM3');

s =  [serial('COM3'), serial('COM4')];

fopen(s);
%% conf
set(s,'BaudRate',9600);
set(s,'DataBit',8);
set(s,'StopBits',1);
set(s,'Terminator','CR/LF');
set(s,'FlowControl', 'hardware');
%%


% fprintf(s,'M:W+P500-P200');
% fprintf(s, 'G');
%each_fprintf(s, '!:');
move_absolutely(s,-100,-100,-500)
% fprintf(s,'S:A00B00');
% fprintf(s,'H:A');
% fprintf(s,'H:B');
% pause(10)
% fprintf(s,'S:A12B00');
% 
%out = fscanf(s)
% ar=round(rand()*13400-6700);
% fprintf(s,['AGO:B+' num2str(ar,'%+4d')]);
% pause(2)
% fprintf(s,'AGO:A-2000');
% fprintf(s,'AGO:B+280');
% % out = fscanf(s)

%%

each_fclose(s);
delete(instrfindall);
clear s;

