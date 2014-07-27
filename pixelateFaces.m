function pixelateFaces(inputVideoName, outputVideoName, numDivs)
% Create a new video by pixelating the faces found in the input video.
% Each face is pixelated using numDivs-by-numDivs blocks.  Use the video
% format .avi.
% Parameters:
%    inputVideoName: the path to the original video
%    outputVideoName: the path where the created video with the faces 
%                     pixelated will be located.
%    numDivs: The number of row (and column) partitions to make when 
%             pixelating a face.

[rate, numFrames, vidIn] = getVideoInfo(inputVideoName);
  % numFrames is the number of frames that make up the video, a scalar
  % vidIn references the input video
  % rate is the frame rate of the video, scalar
vidOut = initializeOutputVideo(outputVideoName, rate);
  % vidOut references the output video
done = onCleanup(@()finalizeVideo(vidOut));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify the code above.
% Write your code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for frame = 1:numFrames
   img = getFrame(vidIn, frame);
   imgPix = img;
   bbox = findFaces(img);
   [faces, cols] = size(bbox);
   faces
   
   for face = 1:faces
      %[tlCol, tlRow, w, h] = bbox(face, 1:4);
      tlCol = bbox(face, 1)
      tlRow = bbox(face, 2)
      w = bbox(face, 3);
      h = bbox(face, 4);
   
        nr = floor(h/numDivs);
        nc = floor(w/numDivs); 

        newHeight = nr * numDivs;
        newWidth = nc * numDivs;
        newCornerRow = tlRow + round((h - newHeight)/2);
        newCornerCol = tlCol + round((w - newWidth)/2);

        subFrame = img(newCornerRow:newCornerRow + newHeight, newCornerCol:newCornerCol + newWidth);
        
        boxSize = newHeight/numDivs; 
        
        pixelatedFrame = pixelate(subFrame, boxSize); 

        imgPix(newCornerRow:newCornerRow + newHeight, newCornerCol:newCornerCol + newWidth) = pixelatedFrame; 
   end
   addFrame(vidOut, imgPix); 
   
   percentCompletion = frame/numFrames * 100;
   
   sprintf('The process is %0.2f%% complete \n', percentCompletion)
end