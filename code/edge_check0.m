%����֡�����Ƚ�����ͼ��֡���ص����Ⱥ�֮�������ĳ����ֵʱ�����ж�����ͻ�䡣
NOF=878;   %ͼƬ����
file_path =  'E:\code\images\';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��

 
for i=1:NOF-1
    image_name_i = strcat(num2str(i),'.jpg');  %ͼ����
    img_i =  imread(strcat(file_path,image_name_i));  %��ȡ��ͼ��
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% ��һ��ͼ����
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %��ȡ��һ��ͼ��
    img_diff(i)=norm(double(img_i(:,:,1)-img_i_plus(:,:,1)))+norm(double(img_i(:,:,2)-img_i_plus(:,:,2)))+norm(double(img_i(:,:,3)-img_i_plus(:,:,3)));  %����ǰ������ͼ���֡���ص����Ⱥ�֮��
end;

Threshold=mean(img_diff)*4;  %��ֵ�趨Ϊƽ�����ز��4��

for i=2:NOF-2
   if(img_diff(i)>img_diff(i-1)&&img_diff(i)>img_diff(i+1)&&img_diff(i)>Threshold)  %�����ͼ������ز����ǰ�������Լ���ֵ�����ж�Ϊ��ͷ�л���֡���
       fprintf('%d\n',i);           %���֡���
   end;
end; 
