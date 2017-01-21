function [output] = relu_forward(input, layer)
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

% Replace the following line with your implementation.
output.data = zeros(size(input.data));
output.data = input.data;
output.data(find(output.data<0)) = 0;
end
