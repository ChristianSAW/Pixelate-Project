function [frameRate, numberOfFrames, vidIn] = getVideoInfo(videoName)
% This function will create a VideoReader object and return 
% important information about the video.
% Parameters:
%     videoName: file path for the video. This is a string
% Output:
%     frameRate: The frame rate of the video, it is a scalar.
%     numberOfFrames: The number of frames of the video, also a scalar.
%     vidIn: The object representing the input video.

vidIn = VideoReader(videoName);
frameRate = vidIn.FrameRate;
numberOfFrames = vidIn.NumberOfFrames;
