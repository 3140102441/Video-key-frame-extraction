obj = VideoReader('E:\code\test.avi');%输入视频位置
NOF=obj.NumberOfFrames;% 帧的总数
mkdir([cd,'/images']);%建立目录
directory=[cd,'/images/'];

for i=1:NOF
    Img_I=read(obj,i); %读取视频
    imwrite(Img_I,[directory,[num2str(i) '.jpg'];]);   %每一帧输出一张jpg
end; 

