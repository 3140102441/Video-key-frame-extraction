%图片相关系数法：定义两幅图像的相关系数来衡量相邻图像帧的相似性。
NOF=878;                    %图像数量
file_path =  'E:\code\images\';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

for i=1:NOF-1
    image_name_i = strcat(num2str(i),'.jpg');  %图像名
    img_i =  imread(strcat(file_path,image_name_i));  %读取该图像
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% 后一张图像名
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %读取后一张图像
    
    img_sim(i)=corr2(img_i(:,:,1),img_i_plus(:,:,1))+corr2(img_i(:,:,2),img_i_plus(:,:,2))+corr2(img_i(:,:,3),img_i_plus(:,:,3));  %计算前后两张图像的相似度
    img_sim(i)=img_sim(i)/3;
end;

Threshold=0.8;              %相似度阈值
for i=1:length(img_sim)
    if(img_sim(i)<Threshold)    %如果相似度小于阈值，则说明与后一张图像不相似，则判定为镜头切换帧
       fprintf('%d\n',i);       %输出帧编号
   end;
end; 