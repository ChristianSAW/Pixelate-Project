function [vidOut] = initializeOutputVideo(videoName, frameRate)
% Initializes a videoFileWriter object to help make a new video
% Parameters:
%     videoName: The path to the video to be created
%     frameRate: The framerate of the new output video
% Output:
%     vidOut: The object representing the output video at the 
%     specified videoName path.

vidOut = VideoWriter(videoName);
vidOut.FrameRate = frameRate;
open(vidOut);
