function tcp_end()
fprintf(t, 'smua.source.output = smua.OUTPUT_OFF');  
fprintf(t, 'smub.source.output = smub.OUTPUT_OFF');  
fprintf(t, 'smua.reset()'); 
fprintf(t, 'smub.reset()');  
pause(0.1) 

fclose(t); 
delete(t); 
clear t 
end