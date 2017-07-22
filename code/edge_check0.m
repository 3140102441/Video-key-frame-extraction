%绝对帧间差法：比较相邻图像帧像素的亮度和之差，当大于某个阈值时，则判定发生突变。
NOF=878;   %图片数量
file_path =  'E:\code\images\';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

 
for i=1:NOF-1
    image_name_i = strcat(num2str(i),'.jpg');  %图像名
    img_i =  imread(strcat(file_path,image_name_i));  %读取该图像
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% 后一张图像名
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %读取后一张图像
    img_diff(i)=norm(double(img_i(:,:,1)-img_i_plus(:,:,1)))+norm(double(img_i(:,:,2)-img_i_plus(:,:,2)))+norm(double(img_i(:,:,3)-img_i_plus(:,:,3)));  %计算前后两张图像的帧像素的亮度和之差
end;

Threshold=mean(img_diff)*4;  %阈值设定为平均像素差的4倍

for i=2:NOF-2
   if(img_diff(i)>img_diff(i-1)&&img_diff(i)>img_diff(i+1)&&img_diff(i)>Threshold)  %如果该图像的像素差大于前后两张以及阈值，则判定为镜头切换的帧编号
       fprintf('%d\n',i);           %输出帧编号
   end;
end; 
