function [bbox] = findFaces(frame)
% This function uses face recognition software to detect faces
% in a frame and returns the smallest bounding box for each face.
% Parameters:
%     frame: image array corresponding to one frame of a video
% Return:
%     bbox: an Nx4 matrix where N is the number of faces detected in the
%     image.  The rth row of bbox specifies the bounding box for the rth
%     face detected:  the upper left corner is at column bbox(r,1) and row
%     bbox(r,2) of frame, the width of the box is bbox(r,3) pixels, and the
%     height of the box is bbox(r,4).  I.e., the lower right corner of the
%     rth bounding box is at column bbox(r,1)+bbox(r,3)-1 and row
%     bbox(r,2)+bbox(r,4)-1.  If no face is detected, bbox is the empty
%     vector.

faceDetector = vision.CascadeObjectDetector();

bbox = step(faceDetector, frame);