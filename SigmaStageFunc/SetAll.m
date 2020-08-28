function [z2_reposition,z3_reposition] = SetAll()
    % Adjusting Parameters
    Folder ='C:\FinderImages\Debug\AAA\20200622_imageQualityCheck';
    % rmdir Folder;
    dl= floor(280*1.5); %xyの刻み 1=2um (120=240um)
    % dl=75; %xyの刻み

    %% scan area
    setting_number=1; %第○象限をきめる。
    switch setting_number
        case 0 
            xmin=-5000;
            xmax=-xmin+dl;
            ymin=-4800;
            ymax=-ymin+dl;
        case 1 %第1象限
            xmin= -30700;
            xmax= xmin+10000;
            ymin= -9000;
            ymax= ymin+8700;
        case 2 %第2象限
            xmin= -19300;
            xmax= xmin+10000;
            ymin= -9400;
            ymax= ymin+8700;
        case 3 %第3象限
            xmin= -17000;
            xmax= 7100;
            ymin= -2700;
            ymax= 7100;
        case 4 %第4象限
            xmin= -30200;
            xmax= xmin+10000;
            ymin= 800;
            ymax= ymin+8400;
        case 5 %第1+2象限
            xmin= -28200;
            xmax= -7100;
            ymin= -12000;
            ymax= -3600;
        case 6 %1+2+3+4象限
           xmin= -28200;
            xmax=  -7100;
            ymin= -12000;
            ymax= 7100;
    end

    z1=0; %(x:min y:min)
    z2=0; %(x:min y:Max)
    z3=0; %(x:Max y:min)%% Don't change
    serial('COM30');
    temp=instrfind();
    for a=1:length(temp)
        fclose(temp(1,a));
        delete(temp(1,a));
    end

    c=0;
    z=z1;

    mkdir(Folder);

    xx=(xmin:dl:xmax)';
    % xx=xx(abs(xx)>550);
    yy=(ymin:dl:ymax);
    % yy=yy(abs(yy)>550);

    zxs=(z2-z1)/(length(xx)-1);
    zys=(z3-z1)/(length(yy)-1);

    xx2=repmat(xx,1,length(yy));
    yy2=repmat(yy,length(xx),1);
    zmap=zeros(size(xx2));
    zn=z1;

    seriallist()
    if exist('vid','var')==1
        %     stop(vid);
        delete(vid);
        clear vid
        imaqreset();
    end
    imaqreset();

    %% start video setting
    hwInfo = imaqhwinfo('pointgrey');
    A=string(hwInfo.DeviceInfo.SupportedFormats)';

    % vid = videoinput('pointgrey', 1, 'F7_BayerRG16_2448x2048_Mode0');
    % vid = videoinput('pointgrey', 1, 'F7_RGB_2448x2048_Mode0');
    % vid = videoinput('pointgrey', 1, 'F7_YUV411_2448x2048_Mode0');%2412s
    vid = videoinput('pointgrey', 1, 'F7_YUV411_1224x1024_Mode2');
    % vid = videoinput('pointgrey', 1, 'F7_YUV444_2448x2048_Mode0'); %2635s
    src = getselectedsource(vid);
    %% video setting old
    % vid.FramesPerTrigger = Inf;
    %src.Brightness=6;
    % vid.FrameGrabInterval = 1;
    % src.FrameRate = 10;
    % src.Gain=0;
    %  src.Exposure=14;
    % src.SharpnessMode = 'Manual';
    % src.Sharpness = 1536;
    %  src.Shutter = 0.068;
    src.WhiteBalanceRB=[474 933];
    src.WhiteBalanceRBMode="Manual";

    %% vR
    %% video setting new(Si/verticalhetero)
    vid.FramesPerTrigger = Inf;
    % src.Brightness=6;
    % vid.FrameGrabInterval = 1;
    % src.FrameRate = 3;
    % src.Gain=0;
     src.Exposure=1.209;
    % src.SharpnessMode = 'Manual';
    % src.Sharpness = 1024;
     src.Shutter = 0.477;
    % src.WhiteBalanceRB=[503 658];
    % src.WhiteBalanceRBMode="Manual";

    % vid.LoggingMode = 'disk&memory';
    % vid.ROIPosition = [224 24 2000 2000];

    %% video setting Shinokita(Si/Wse2)
    vid.FramesPerTrigger = Inf;
    src.Brightness=12;
    % vid.FrameGrabInterval = 1;
    % src.FrameRate = 3;
    src.Gain=6;
    src.Exposure=1.9;
    % src.SharpnessMode = 'Manual';
    % src.Sharpness = 1024;
     src.Shutter = 0.477;
    % src.WhiteBalanceRB=[503 658];
    % src.WhiteBalanceRBMode="Manual";

    % vid.LoggingMode = 'disk&memory';
    % vid.ROIPosition = [224 24 2000 2000];
    start(vid);

    %% start / Serial Setting
    s = [serial('COM5'), serial('COM4')];
    SetEachPort(s)
    fopen(s(1));
    fopen(s(2));
    % SerialSend(s,'?');
    % SerialSend(s,'RESTA:');
    pause(0.1);
    flushdata(vid);
    % 
    % SerialSend(s,'X:1');
    % SerialSend(s,'X:R');
    % SerialSend(s,'P:04R');
    % SerialSend(s,'P:04A31B36')
    % SerialSend(s,'P:04A36B36C31')
    % SerialSend(s,'P:53,0,0,0,0')
    % SerialSend(s,'F:')
    % SerialSend(s,'P:04R');
    flushdata(vid);
    flushinput(s(1));
    flushinput(s(2));

    %set Speed of2ax controller
    SerialSend(s(1), "D:2S500F5000R200S500F5000R200");
    SerialSend(s(2), "D:1S500F5000R200");
    while(s(1).BytesAvailable)
        fscanf(s(1))
    end

    while(s(2).BytesAvailable)
        fscanf(s(2))
    end
    % src.Brightness;

    %% scan
    % SerialSend(s,'S:A00B00C06');
    % SerialSend(s,'D:A2000P4000P0500')
    % SerialSend(s,'D:B2000P4000P0500')
    % SerialSend(s,'D:C2000P4000P0500')

    % SerialSend(s,'D:A500P1500P0500')
    % SerialSend(s,'D:B500P1500P0500')
    % SerialSend(s,'D:C500P1500P0500')
    % 
    % SerialSend(s,'D:A0500P1000P1000')
    % SerialSend(s,'D:B0500P1000P1000')
    % SerialSend(s,'D:C0500P1000P1000')
    % SerialSend(s,'F:')
    % SerialSend(s(2),['A:W+P' num2str(z,'%d')]);
    % SerialSend(s(2), "G:");
    flushinput(s(1));
    flushinput(s(2));
    % if(vid.FramesAvailable>0)
    %     test=gpuArray(getdata(vid));
    % end
    % flushdata(vid);
    SetToCenter(s, vid);
    SetToCenter(s, vid);
    
    ImageShowEnable= true;
    moveStage(s, false, xmin, ymin, z1, vid);
    
    z1_reposition="";
    while  z1_reposition~="ok"
        [FF,camera_image] = GetFF(s,vid,z1,1,ImageShowEnable);
        imshow(ycbcr2rgb(camera_image));
        z1_reposition = input("Current z:"+z1_reposition+"move lens barrel to focus. If alreafy focused, input ok");
    end
    
    z2_reposition="";
    moveStage(s, false, xmin, ymax, z2, vid);
    while z2_reposition~="ok"
        [FF,camera_image] = GetFF(s,vid,z2,1,ImageShowEnable);
        imshow(ycbcr2rgb(camera_image));
        z2_reposition=input("Current z:"+z2_reposition+"input proper z to focus. If alreafy focused, input ok");
        moveStage(s, false, xmin, ymax, z2_reposition, vid);
    end
    
    z3_reposition="";
    moveStage(s, false, xmax, ymin, z3, vid);
    while z3_reposition~="ok"
        [FF,camera_image] = GetFF(s,vid,z3,1,ImageShowEnable);
        imshow(ycbcr2rgb(camera_image));
        z3_reposition=input("Current z:"+z3_reposition+"input proper z to focus. If alreafy focused, input ok");
        moveStage(s, false, xmax, ymin, z3_reposition, vid);
    end
    
    
end

