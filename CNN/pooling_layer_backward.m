function [input_od] = pooling_layer_backward(output, input, layer)

% Replace the following line with your implementation.
input_od = zeros(size(input.data));
batch_size = input.batch_size;

stride = layer.stride;
k = layer.k;
pad = layer.pad;

h_in = input.height;
w_in = input.width;

 
for n = 1: batch_size
   colData = output.data(:, n);
   inputData = input.data(:,n);
   outDiffVec = output.diff(:,n);
   countDiff = 1;

   chLength = length(colData)/input.channel;                %output Length of each channel
   htInp = sqrt(chLength)*stride - stride + k - 2*pad;      % input.height
   imgIdx = 1;
   numPixels = htInp * htInp;                                %Total no of elements in one channel of input image
   outMat = [];                                             % stores the found maxpool values
   
   for i = 1:chLength:length(colData)                      %for every channel
      colMat = colData(i:i+chLength-1);                     % output sub-col vector for every channel
      tempMat = inputData(imgIdx: imgIdx+ numPixels-1) ;    %Corresponding input column 
      imgIdx = imgIdx+numPixels;                            %input index
      tempMat = (reshape(tempMat,[htInp, htInp]))' ;
    
      matchMat = ismember(tempMat, colMat);                 % Finding pool elements in input matrix
    
      idxDiff = find(matchMat);
      diffMat = zeros(htInp);                               % create Matrix for output diff
      diffMat(idxDiff) = 1;                                 % Assign pool max values as one
      
      %------------------------------SUBMATRIX-------------------

       for x = 1: stride : h_in-k+1
                for y=1: stride : w_in-k+1;
                    diffMat(x:x+k-1, y:y+k-1) = outDiffVec(countDiff)*diffMat(x:x+k-1, y:y+k-1);
                    countDiff = countDiff+1;
                end
       end
       %-------------------------------------------------------------         
      matchMat = matchMat.*diffMat;                                        % Dot matrix multiplication of output.diff
      outMat = [outMat;(reshape(matchMat',[numPixels,1]))];                    % Reshaping matrix to column vector
 
   end
   input_od(:,n) = outMat;

end

end
