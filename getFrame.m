function frame = getFrame(vidIn, frameNum)
% This function takes in a video object and a frame index and returns that
% frame.
% Parameters:
%   video:  videoFileReader object
%   frameNum:  the index (number) of the frame we want to get (a scalar)
% Return:
%   frame: the frameNum-th frame in the video (an image array)


frame = read(vidIn, frameNum);