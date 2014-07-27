Pixelate-Project
================

This program pixelates entire pictures and pixelates faces in videos.
The code was written in MatLab. 

The Pixelate function works by breaking the image into n-by-n blocks. 
All the pixels in an individual block have the same color. 
Then the function calculates the average value of the pixels in each block of the picture. 
The picture has been converted to Unit8 type for this. 
The function assigns the pixels in each block the blocks respective average value, blurring or 
"pixelating" the image.

The pixelateFaces function works similarly but on a frame by frame basis. 
Essentially, the functions does the same thing as pixelate but for each frame of the video and 
for a specified region of the picture: the face. With the assistance of built in MatLab face recognition
software, function can recognize faces of a picture. With this function, a new video is produced
with pixelated faces throughout. 


To use the program write the following in the compiler: 
% For pictures: 

clc
p= imread('picture file name as a jpg')
z= pixelate(p,n) 

% n = the number of blocks in the row and column dimensions.
% Assume that n is smaller than the number of rows and the number 
% of columns in img.  Assume that n is a reasonable integer value, 
% say, n>=3 and n<=12  

imshow(z)

% For video: 

clc
pixelateFaces('inputVideoName', 'outputVideoName', numDivs) 
%inputVideoName = the path to the original video. must be in avi format. 
%outputVideoName = the path where the created video with faces pixelated will be located. 
%numDivs: The number of row (and column) partitions to make when pixelating a face.
