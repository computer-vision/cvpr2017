function [ns_opt ds_opt] = optimizeMirrorParameters(qs, A, ns, ds)

init_value = [];
num_of_mirror = size(ns, 2);

% Initial mirror parameters 
for i_m = 1:num_of_mirror
  [n_hl n_el] = transformVectorToEuler(ns{i_m});
  init_value = [init_value; n_hl; n_el; ds{i_m}];
end

% Optimization
option = optimset('Display', 'off');
option = optimset(option, 'Algorithm', 'levenberg-marquardt');

[x, resnorm, residual, exitflag, output] = ...
    lsqnonlin(@coreOptimizationOfMirrorParameters, init_value, [], [], option, qs, A, num_of_mirror);

ds_base = x(3);

for i_m = 1:num_of_mirror
  offset = (i_m-1) * 3;
  ns_opt{i_m} = transformEulerToVector(x(offset+1), x(2+offset));
  ds_opt{i_m} = x(offset+3) / ds_base;
end
