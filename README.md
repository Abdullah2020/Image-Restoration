# Image-Restoration

The target of this task is to develop a model to correct an image whose lines have been shifted by some pixels. The step by step approach adopted is explained below:

+ The image was read using the “imread()” function. The image is imported as a bmp file, enlarged with a multiplicative factor of 255 and then displayed.
+ The “size()” function was used to store in the dimensions of the image in memory which is 2055 in the y-axis and 3072 in the x-axis
+ To re-adjust the pixels to the right positions, it is assumed that the first horizontal line of the image is correctly placed and the subsequent horizontal lines of the image are shifted either left or right in order to correct the offsets. This means that line 1 is intact and then the remaining 2054 lines are adjusted back to position. To achieve this, the matlab “xcorr()” function and the “max()” function was used. The “xcorr()” function calculate the inter-correlation between two separate subsequent lines of the image and this includes both the correlation magnitude and position. The “max()” function to store this maximum value and the location.
+ The difference between the location and the reference with a width of 3072 gives the shift of that line from the reference. This is cumulatively stored using the “cumsum()” function.
+ Finally, using the “circshift()” function, all the shifts previously evaluated were added to the horizontal lines but we start from line 2 since line 1 is the reference line.

# Result:

### Original Image

![fichier2](https://user-images.githubusercontent.com/16369782/184452216-536ccf89-f81e-4559-9095-dfaadc12ef2e.jpg)


### Restored Image

![output](https://user-images.githubusercontent.com/16369782/184452047-76890993-a187-4257-a003-cb80a709d419.jpg)
