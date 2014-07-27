function addFrame(vidOut, frame)
% This function adds one frame to the video defined by the vidOut object.
% Parameters:
%     vidOut: A VideoWriter object to which the frame will be added
%     frame: The frame to add to the video

writeVideo(vidOut, frame);