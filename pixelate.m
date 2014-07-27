function [pixelatedImage] = pixelate(img, n)
% Pixelate the image array img by breaking it into n-by-n blocks; all the
% pixels in an individual block has the same color.
% Parameters:
%     img: an image array (type uint8) to be pixelated
%     n: the number of blocks in the row and column dimensions.
%        Assume that n is smaller than the number of rows and the number 
%        of columns in img.  Assume that n is a reasonable integer value, 
%        say, n>=3 and n<=12
% Return:
%     pixelatedImage: the pixelated image array (type uint8).  This array
%        has the same size as img.
% Pixelation is done by splitting the array into n-by-n blocks of pixels.  
% For a 2-d array, calculate the average value for each block and then
% assign to all pixels in the corresponding block in pixelatedImage that
% average value.  For a 3-d array, calculate the average for each layer in
% the block separately and assign the averages to the corresponding layers
% in the corresponding block in pixelatedImage.
% Let nr and nc be the number of rows and number of columns, respectively,
% in img.  If nr is divisible by n then each block has the same number of
% rows of pixels; otherwise the first n-1 rows of blocks each has the same
% number of rows of pixels while the nth row of blocks has the remaining 
% rows of pixels.  The number of columns of pixels for the blocks is 
% similarly determined. 
[nr, nc, h] = size(img);
pixelatedImage = zeros(nr, nc, h);
pixelatedImage = uint8(pixelatedImage);

rowPos = 1;
colPos = 1;

pRow = floor(nr/n);
pCol = floor(nc/n);

remRow = rem(nr, ((n - 1)*pRow));
remCol = rem(nc, ((n - 1)*pCol));

rowBlock = 1;
colBlock = 1;    

%if (mod(nr, n) == 0 && mod(nc, n) == 0)
    while (rowPos <= nr - pRow + 1 && rowBlock <= n)
        
        if (colBlock == n)
            pCol = remCol;
            colBlock = 0;
        else
            pCol = floor(nc/n);
        end
        
        if (rowBlock == n)
            %pRow = nr - ((n - 1)*pRow);
            pRow = remRow;
        end
        
        for z = 1:h
            meanRGB = zeros(1, 1, h);
            meanRGB(1, 1, z) = round(mean(mean(img(rowPos:rowPos + pRow - 1, colPos:colPos + pCol - 1, z))));
            pixelatedImage(rowPos:rowPos + pRow - 1, colPos:colPos + pCol - 1, z) = meanRGB(1,1,z);
        end

        colPos = colPos + pCol;
        colBlock = colBlock + 1;
        
        if (colPos > nc - pCol + 1)
            colPos = 1;
            rowPos = rowPos + pRow;
            rowBlock = rowBlock + 1;
        end
    end
%end