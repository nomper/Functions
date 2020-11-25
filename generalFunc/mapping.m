a% version 2.0 20201125
clear

FolderName ='D:\FinderImages\Tanaka\20201028_mos2';
FolderName = string(FolderName);
gpuEnable = false;

mag = 0.2;
FL = deblank(string(ls(fullfile(FolderName, "*.tiff"))));
FLt = FL(~contains(FL, "black"));
x = zeros(length(FL),1);
y = x;
for f = 1:size(FLt,1)
    FileName = FLt(f, 1);
    [xy, idx] = sscanf(FileName, "%d_%d.tiff");
    if(idx<2)
        continue;
    end
    x(f) = xy(1);
    y(f) = xy(2);
end

xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);
dx1 = diff(x);
dx = min(abs(dx1(dx1~=0)));
% clear x y xy
n = 0;
xx = xmin:dx:xmax;
yy = ymin:dx:ymax;

if(gpuEnable)
    AA = gpuArray(zeros(ymax - ymin+3000, xmax - xmin+3000, 3, 'single'));
else
    AA = zeros(ceil(length(yy)*mag*2200), ceil(length(xx)*mag*2200), 3, 'uint8');
end
size(AA)
ticb = tic;
for xc = 1:length(xx)
    tica = tic;
    for yc = 1:length(yy)
        x = xx(xc);
        y = yy(yc);
        % for y = ymin:d:ymax
        %     for x = xmin:d:xmax
        f = deblank(string(ls(strcat(FolderName, sprintf("/%+d_%+d*.tiff", x, y)))));
        filepath = fullfile(FolderName, f);
        if(~exist(filepath,'file') || ~contains(f,".tiff"))
            %                 send(q2, filepath);
            continue;
        end
        if(gpuEnable == true)
            Img = gpuArray(single(imread(filepath)));
        else
            Img = imread(filepath);
        end
        Imgr = imresize(Img, mag);
%         Imgcr = imcrop(Imgr, [0 40 410 430]);
        Imgcr = imcrop(Imgr, [40 0 409 410]);
        Imgrr = imrotate(Imgcr, 270);
        AA((size(Imgrr,1)*(yc)+1):(size(Imgrr,1)*(yc)+size(Imgrr,1)), (size(Imgrr,2)*(length(xx)-xc+1)+1):(size(Imgrr,2)*(length(xx)-xc+1)+size(Imgrr,2)), :) = Imgrr;

    end
    
    fprintf("%3d @ %3d %2.1f\n", xc, length(xx), (length(xx)-xc)*toc(tica));
    %         figure(2);
    %         n = n + 1;
    %         if(gpuEnable == true)
    %             AAu = uint8(AA);
    % %             imshow(AAu);
    %         else
    % %             imshow(AA);
    %         end
    % %         drawnow
end
%% 後処理

if(gpuEnable == true)
    AAu = uint8(AA);
end
%     AA_gray = sum(AA,3);
AA_gray = AA(:,:,2);
AA_x = sum(AA_gray,1)>0;
AA_y = sum(AA_gray,2)>0;
AA = AA(AA_y,AA_x,:);
imshow(AA);
toc(ticb);
tic
imwrite(AA, strcat(FolderName, ".tiff"));
% imwrite(AA(:,1:end/2,:), strcat(FolderName, "1.tiff"));
% imwrite(AA(:,end/2:end,:), strcat(FolderName, "2.tiff"));

toc
% imwrite(AA, "css01.png");
toc