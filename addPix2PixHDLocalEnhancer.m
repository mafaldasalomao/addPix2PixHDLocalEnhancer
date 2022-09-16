%addPix2PixHDLocalEnhancer
%Add local enhancer network to pix2pixHD generator network

inputSize = [512 1024 32];
%% Create a pix2pixHD global generator network.

pix2pixHD = pix2pixHDGlobalGenerator(inputSize)


%% Add a local enhancer network to the pix2pixHD network.
pix2pixHDEnhanced = addPix2PixHDLocalEnhancer(pix2pixHD)

analyzeNetwork(pix2pixHDEnhanced)

%% Filters
%'FilterSizeInFirstAndLastBlocks',[5 7] adds a local enhancer whose first and last convolution layers have a size of 5-by-7
%Filter size in the first and last convolution layers of the local enhancer
% network, specified as a positive odd integer or 2-element vector of 
% positive odd integers of the form [height width]. When you specify the 
% filter size as a scalar, the filter has equal height and width.


% psampleMethod — Method used to upsample activations
% "transposedConv" (default) | "bilinearResize" | "pixelShuffle"
% Method used to upsample activations in the local enhancer network, specified as one of these values:
% 
% "transposedConv" — Use a transposedConv2dLayer (Deep Learning Toolbox) with a stride of [2 2]
% 
% "bilinearResize" — Use a convolution2dLayer (Deep Learning Toolbox) with a stride of [1 1] followed by a resize2dLayer with a scale of [2 2]
% 
% "pixelShuffle" — Use a convolution2dLayer (Deep Learning Toolbox) with a stride of [1 1] followed by a depthToSpace2dLayer with a block size of [2 2]