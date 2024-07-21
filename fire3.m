% fire detection
%%%Fuction detects fire from the image in JPEG format

clc;
clear all;
close all hidden;

Im1= imread('fire3.jpg');% give your file loction.  % 
%Im1= imread('fire5.jpg');% give your file loction.
%Im1= imread('fire7.jpg');% give your file loction.
%Im1= imread('fire9.jpg');% give your file loction.
%Im1= imread('fire11.jpg');% give your file loction.
%Im1= imread('fire13.jpg');% give your file loction.
%Im1= imread('fire-123784_1280.jpg');% give your file loction.
%Im1= imread('fire21.jpg');% give your file loction.
%Im1= imread('fire23.jpg');% give your file loction.
%Im1= imread('fire25.jpg');% give your file loction.
%Im1= imread('fire27.jpg');% give your file loction.
%Im1= imread('fire29.jpg');% give your file loction.
%Im1= imread('fire31.jpg');% give your file loction.
Im1= imread('fire33.jpg');% give your file loction.
figure, imshow(Im1)

figure , 
subplot (2,2,1)
imshow(Im1);title ('original image');colorbar;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
rchannel =Im1( :,: ,1);
gchannel =Im1( :,: ,2);
bchannel=Im1( :,: ,3);


%below lines for display the R, G and  B cloured  image
%
R = Im1;
R(:,:,2:3) = 0;
G = Im1;
G(:,:,[1 3]) = 0;
B = Im1;
B(:,:,1:2) = 0;
subplot(2,2,2)
image(R);
pause(1);colorbar;
subplot(2,2,3)
image(G);
pause(1);colorbar;
subplot(2,2,4)
image(B);
pause(1);colorbar;
%
%%extracting chrominace , chrominace blue and red

Ydash = 16+(0.2567890625  * rchannel)+ (0.50412890625 * gchannel) +( 0.09790625 * bchannel);
Cb= 128+(-0.14822265625 * rchannel)-(0.2909921875 * gchannel) + (0.43921484375* bchannel);
Cr = 128+(0.43921484375  * rchannel)- (0.3677890625 * gchannel) -( 0.07142578125 * bchannel);



%
 Ymean=  (mean(mean(Ydash)));
 Cbmean= (mean(mean(Cb)));
 Crmean= (mean(mean(Cr)));
 Crstd= std2(Cr);
figure;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
imshow(Ydash); title ('Ycomponent');
pause(1);colorbar;
subplot(2,2,2)
imshow(Cb); title ('Chrominance BLUE');
pause(1);colorbar;
subplot(2,2,3)
imshow(Cr); title ('Chrominance RED');
pause(1);colorbar;

%------------------------------------------------------------------
%
% 
mask1 = uint8(zeros(size(Im1,1),size(Im1,2))); 
for i = 1:size(mask1,1)
    for j = 1:size(mask1,2)
         if (Ydash(i,j)>220) 
             mask1(i,j)=255; 
         else 
             ; 
         end
    end
end
P=60;
mask1 =  bwareaopen(mask1,P);
figure, imshow(mask1),title('mask1')

mask4 = uint8(zeros(size(Im1,1),size(Im1,2))); 
for i = 1:size(mask4,1)
    for j = 1:size(mask4,2)
         if (Cr(i,j)>160) 
             mask4(i,j)=255; 
         else 
             ; 
         end
    end
end

figure, imshow(mask4),title('mask4')

% mask2 = uint8(zeros(size(Im1,1),size(Im1,2))); 
% for i = 1:size(mask2,1)
%     for j = 1:size(mask2,2)
%          if ( (Ydash(i,j)>=140 | Ydash(i,j)<=65)  & (Cb(i,j)<=120 & Cb(i,j)>=50)& (Cr(i,j)>120 & Cr(i,j)<220))
%              mask2(i,j)=255; 
%          else 
%              ; 
%          end
%     end
% end
% 
% figure , imshow(mask2) , title('mask2')

mask3 = zeros(size(Im1,1),size(Im1,2));

mask3 = and ((Cb > 90)& (Cb <150), Cr >160); 
mask3 = mask3*255;
figure , imshow(mask3),title('mask3')



mask5 = zeros(size(Im1,1),size(Im1,2)); 
for i = 1:size(mask5,1)
    for j = 1:size(mask5,2)
         if (Im1(i,j,1) > 220 & Im1(i,j,2) > 90 &  Im1(i,j,3) < 140)
             mask5(i,j)=255; 
         else 
             ; 
         end
    end
end
figure , imshow(mask5) , title('mask5')

mask6 = zeros(size(Im1,1),size(Im1,2)); 
mask6 =  mask3 |mask4 | mask5; 
figure,imshow(mask6),title('mask6')



mIm1(:,:,1) =( Im1(:,:,1)).*uint8(mask6);
mIm1(:,:,2) =( Im1(:,:,2)).*uint8(mask6);
mIm1(:,:,3) =( Im1(:,:,3)).*uint8(mask6);
figure, imshow(mIm1)



