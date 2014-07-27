function finalizeVideo(video)
% This function closes the videos so as to let Matlab know we are 
% done working with them. This function should be called at the end
% of any script that uses vidIn and vidOut.
% 
% Parameters:
%     video: A VideoWriter object representing a video to be closed.

close(video);