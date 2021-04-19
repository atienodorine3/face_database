cam = webcam;
nof = input('enter no. of required frames:');
count = 1;
while count <= nof
    img = snapshot(cam);
    [croppedFrame, bboxpoints] = myfacedetect(img);
    imshow(croppedFrame)
  
    if ~isempty(croppedFrame)
        fileName = strcat('/home/pauljuma/Documents/MATLAB/imagedatabase',sprintf('%d.png',count));
        imwrite(croppedFrame, fileName)
        msg = ['image aquired no:', num2str(count)];
        disp(msg)
        count = count + 1;
        
    else
        disp('no face detected')
    end
    
        clf('reset')
        pause(0.1)
    
end
clear cam;