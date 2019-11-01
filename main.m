clear; clc;
path = 'RaceHorses_832x480_30.yuv';
width = 832;
height = 480;
nFrames = 1;
blockSizeW = 8;
blockSizeH = 8;
components = 1;
[bY, ~, ~] = readVideo(path, width, height, nFrames, blockSizeW, blockSizeH, components);
block = bY(:,:,1800,1);
[sobelV, sobelH] = edgeDetection(block, 'Sobel');
[prewittV, prewittH] = edgeDetection(block, 'Prewitt');
[robertsV, robertsH] = edgeDetection(block, 'Roberts');
m = media(block);
[dH, dV, dUR, dUL, vH, vV, vUR, vUL] = desvio_variancia(block, blockSizeW, blockSizeH);
imshow(block);