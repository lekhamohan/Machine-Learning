function [output] = inner_product_forward(input, layer, param)

d = size(input.data, 1);
k = size(input.data, 2);
n = size(param.w, 2);

% Replace the following line with your implementation.
output.data = zeros([n, k]);

repParamB = repmat(param.b',1,k);
output.data = param.w'*input.data + repParamB;
%Self set
% output.height = 1;
% output.width = 1;
% output.channel = input.channel;
% output.batch_size = input.batch_size;

end
