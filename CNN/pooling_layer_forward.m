function [output] = pooling_layer_forward(input, layer)

h_in = input.height;
w_in = input.width;
c = input.channel;
batch_size = input.batch_size;
k = layer.k;
pad = layer.pad;
stride = layer.stride;

h_out = (h_in + 2*pad - k) / stride + 1;
w_out = (w_in + 2*pad - k) / stride + 1;

output.height = h_out;
output.width = w_out;
output.channel = c;
output.batch_size = batch_size;
count = 1;
skip = k;
% Replace the following line with your implementation.
output.data = zeros([h_out * w_out * c, batch_size]);
    
  for n=1: batch_size
        col = input.data(:, n);     
        imgExt = zeros(h_in*w_in,c) ; 
        index = 1; count = 1;
        
        for j=1:c
            imgExt(:,j) = col(index:h_in*w_in*j);
            index = h_in*w_in*j+1;
            sepImage = (reshape(imgExt(:,j), [h_in,w_in]))';
           % sepImage = (reshape(imgExt(:,j), [h_in,w_in]))
            for x = 1: stride : h_in-k+1
                for y=1: stride : w_in-k+1
                    tempMat = sepImage(x:x+k-1, y:y+k-1);
                    maxNum = max(tempMat(:));
                    output.data(count,n) = maxNum;
                    count = count+1;
                end
            end
           
        end
   end


end

