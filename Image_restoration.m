clc;
clear B;
%read the image from file
B = imread('fichier2.bmp','bmp');
B = 255 * B;
image(B);
colormap("gray")

% get and display the values of rows and column of the image
[row,col] = size(B);
disp (row)
disp(col)

% imfinfo("fichier2.bmp")
%calculate the shift using the xcorr() function starting with the 
% first line and second line and repeat the same for the second and next 
% for all the lines. The max() function is used to get the maximum distance
% between the lines and the location
shift = zeros(row,1);
for n=1:row - 1
 u = xcorr(B(n + 1,:),B(n,:));
 [a, b] = max(u);
 shift(n+1) = col - b;
end

%add up all the shift into 'cumshift' from the second line to the last
%using cumsum () function
cumshift = cumsum(shift);

%print the values of the cumulative shifts
disp(cumshift)

%all the shift are added into to the horinzontal lines starting from line2
T = zeros(row,col);
T(1,:) = B(1,:);
for k = 2:row
    T(k,:)= circshift(B(k,:),cumshift(k));
end

%displaye the new image(T)
image(T);
