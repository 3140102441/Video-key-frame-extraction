%��֪��ϣ������֪��ϣ������������ͼƬ������һ�ֿ����㷨��
NOF=878;     %ͼ������
file_path =  'E:\code\images\';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��

Threshold=2;               %��ֵ�趨Ϊ2
count=zeros(NOF-1,1);      %���ڼ�¼���һ��ͼ���ж���λ�ǲ�ͬ��
for i=1:NOF-1
   image_name_i = strcat(num2str(i),'.jpg');  %ͼ����
    img_i =  imread(strcat(file_path,image_name_i));  %��ȡ��ͼ��
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% ��һ��ͼ����
    img_i_plus =  imread(strcat(file_path,image_name_i_plus));  %��ȡ��һ��ͼ��
    
    imbw_i=im2bw(rgb2gray(imresize(img_i,[8,8])));     %��ͼ��ת��Ϊ64�������Լ�64���Ҷ�
    imbw_i_plus=im2bw(rgb2gray(imresize(img_i_plus,[8,8]))); %����һ��ͼ��ת��Ϊ64�������Լ�64���Ҷ�
    for j=1:8
        for k=1:8
            if(imbw_i(j,k)~=imbw_i_plus(j,k))
                count(i)=count(i)+1;            %�������һ��ͼ���ж���λ�ǲ�ͬ��
            end;
        end;
    end; 
end;
for i=1:NOF-1
    if(count(i)>Threshold)     %���count������ֵ��˵�����һ��ͼ����ܴ����ж�Ϊ��ͷ�л���֡���
       fprintf('%d\n',i);      %���֡���
   end;
end; 