function [output] = elu_forward(input, layer)
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

alpha = 1.0;
% Replace the following line with your implementation.
output.data = zeros(size(input.data))
output.data = input.data
idx = find(output.data<= 0)
output.data(idx) = alpha*(exp(input.data(idx))-1)
end
