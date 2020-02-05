function compress_dct(image)
    img=imread(image);
    subplot(1,3,1);
    imshow(img);
    title('Original image');
    
    img=rgb2gray(double(img)/255);
    subplot(1,3,2);
    imshow(img);
    title('Grayscale image');
    
    img_dct=dct2(img);
    img_pow=img_dct.^2;
    img_pow=img_pow(:);
    [B,index]=sort(img_pow);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(img));
    coeff=20000;
    for k=1:coeff
        compressed_dct(index(k))=img_dct(index(k));
    end
    img_dct_f=idct2(compressed_dct);
    
    subplot(1,3,3);
    imshow(img_dct_f);
    title('Compressed image');
    imwrite(img_dct_f,'compressed.jpg');
end