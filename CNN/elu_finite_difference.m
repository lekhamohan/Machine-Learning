function [input_od_approx] = elu_finite_difference(output, input, h)

% Replace the following line with your implementation.
layer.k = 2;

%input_od_approx = zeros(size(input.data));
outputH = elu_forward(input, layer);
inputOld = input;
inputOld.data = input.data+h;
outputOld = elu_forward(inputOld, layer);
input_od_approx = (outputOld.data-outputH.data)/h;
input_od_approx= input_od_approx.*output.diff;


end
