function gpib_init_cond(obj)

% Input is A
fprintf(obj, 'ISRC0');
% CH1 is R. CH2 is theta.
fprintf(obj, 'DDEF1,1,0');
fprintf(obj, 'DDEF2,1,0');
%GPIB mode
fprintf(obj, 'OUTX1');
% read ref. freq.
Freq = double(deblank(string(query(obj, 'FREQ?'))));

fprintf(obj, 'APHS');
fprintf(obj, 'DDEF');
fprintf(obj, 'APHS');
Out_X = zeros(1,50);
Out_Y = Out_X;
Out_Z = Out_X;
Out_R = Out_X;
Out_P = Out_X;
Time = Out_R;
timer_a = tic;
for a = 1:60
    Out_X(a) = double(deblank(string(query(obj, 'OUTP?1'))));
    Out_Y(a) = double(deblank(string(query(obj, 'OUTP?2'))));
    Out_R(a) = double(deblank(string(query(obj, 'OUTP?3'))));
    Out_P(a) = double(deblank(string(query(obj, 'OUTP?4'))));
    Time(a) = toc(timer_a);
    disp(a)
    %     pause(0.1)
end
figure(1);
subplot(2,2,1);title("X");
plot(Time,Out_X*1000);
ylabel("X");
subplot(2,2,2);title("Y");
plot(Time,Out_Y*1000);
ylabel("Y");
subplot(2,2,3);title("R");
plot(Time,Out_R*1000);
ylabel("R")
subplot(2,2,4);title("\theta");
plot(Time,Out_P);
ylabel("theta")
fclose(obj);