function [input_od] = elu_backward(output, input, layer)

alpha = 1.0;
% Replace the following line with your implementation.
input_od = zeros(size(input.data));
%input_od = ones(size(input.data));
idxG= find(output.data > 0);
idxL = find(output.data <= 0);
input_od(idxG) = alpha*output.diff(idxG);
input_od(idxL) = output.diff(idxL).*exp(input.data(idxL));
end
