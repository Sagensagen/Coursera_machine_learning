function image1 = processImage(img)
    fprintf('inside processImage\n')

    cropPercentage =0;

    yiq = rgb2ntsc(imread(img));
    
    img_gray = yiq(:,:,1);
    
    oldSize = size(img_gray);


    cropDelta = floor((oldSize - min(oldSize)) .* (cropPercentage/100));
    

    finalSize = oldSize - cropDelta;
    
    cropOrigin = floor(cropDelta / 2) + 1;
    
    copySize = cropOrigin + finalSize - 1;
    
    croppedImage = img_gray( ...
    cropOrigin(1):copySize(1), cropOrigin(2):copySize(2));
    imshow(croppedImage)
    
    scale = [20 20] ./ finalSize;
    
    newSize = max(floor(scale .* finalSize),1);
    

    rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5), finalSize(1));
    colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5), finalSize(2));
    

    newImage = croppedImage(rowIndex,colIndex,:);
    newImage = rot90(newImage, 1);
    invertedImage = - newImage;


    maxValue = max(invertedImage(:));
    minValue = min(invertedImage(:));
    delta = maxValue - minValue;
    
    normImage = (invertedImage - minValue) / delta;

    contrastedImage = sigmoid((normImage -0.5) * 20);

    imshow(contrastedImage, [-1, 1] );

    image1 = reshape(contrastedImage, 1, newSize(1)*newSize(2));

end