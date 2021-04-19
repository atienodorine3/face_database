function [ croppedImage, bboxpoints] = myfacedetect(img)
faceDetector = vision.CascadeObjectDetector;
faceDetector.MergeThreshold = 10;
bboxes = faceDetector(img);
if ~isempty(bboxes)
    bboxes(1,1) = bboxes(1,1)-50;
    bboxes(1,2) = bboxes(1,2)-50;
    bboxes(1,3) = bboxes(1,3)+100;
    bboxes(1,4) = bboxes(1,4)+100;
    
    croppedImage = imcrop(img, bboxes);
    bboxpoints = bbox2points(bboxes(1, :));
else
    croppedImage = [];
    bboxpoints = [];
end

