%ͼƬ���ϵ��������������ͼ������ϵ������������ͼ��֡�������ԡ�
NOF=878;                    %ͼ������
file_path =  'E:\code\images\';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��

for i=1:NOF-1
    image_name_i = strcat(num2str(i),'.jpg');  %ͼ����
    img_i =  imread(strcat(file_path,image_name_i));  %��ȡ��ͼ��
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% ��һ��ͼ����
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %��ȡ��һ��ͼ��
    
    img_sim(i)=corr2(img_i(:,:,1),img_i_plus(:,:,1))+corr2(img_i(:,:,2),img_i_plus(:,:,2))+corr2(img_i(:,:,3),img_i_plus(:,:,3));  %����ǰ������ͼ������ƶ�
    img_sim(i)=img_sim(i)/3;
end;

Threshold=0.8;              %���ƶ���ֵ
for i=1:length(img_sim)
    if(img_sim(i)<Threshold)    %������ƶ�С����ֵ����˵�����һ��ͼ�����ƣ����ж�Ϊ��ͷ�л�֡
       fprintf('%d\n',i);       %���֡���
   end;
end; 