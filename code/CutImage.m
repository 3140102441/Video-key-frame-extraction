obj = VideoReader('E:\code\test.avi');%������Ƶλ��
NOF=obj.NumberOfFrames;% ֡������
mkdir([cd,'/images']);%����Ŀ¼
directory=[cd,'/images/'];

for i=1:NOF
    Img_I=read(obj,i); %��ȡ��Ƶ
    imwrite(Img_I,[directory,[num2str(i) '.jpg'];]);   %ÿһ֡���һ��jpg
end; 

