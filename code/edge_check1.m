%感知哈希法：感知哈希法是用于相似图片搜索的一种快速算法。
NOF=878;     %图像数量
file_path =  'E:\code\images\';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

Threshold=2;               %阈值设定为2
count=zeros(NOF-1,1);      %用于记录与后一张图像有多少位是不同的
for i=1:NOF-1
   image_name_i = strcat(num2str(i),'.jpg');  %图像名
    img_i =  imread(strcat(file_path,image_name_i));  %读取该图像
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% 后一张图像名
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %读取后一张图像
    
    imbw_i=im2bw(rgb2gray(imresize(img_i,[8,8])));     %将图像转化为64个像素以及64级灰度
    imbw_i_plus=im2bw(rgb2gray(imresize(img_i_plus,[8,8]))); %将后一张图像转化为64个像素以及64级灰度
    for j=1:8
        for k=1:8
            if(imbw_i(j,k)~=imbw_i_plus(j,k))
                count(i)=count(i)+1;            %计算与后一张图像有多少位是不同的
            end;
        end;
    end; 
end;
for i=1:NOF-1
    if(count(i)>Threshold)     %如果count大于阈值，说明与后一张图像差别很大，则判定为镜头切换的帧编号
       fprintf('%d\n',i);      %输出帧编号
   end;
end; 