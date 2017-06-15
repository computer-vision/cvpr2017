function [n_12 d_12] = computeMultiReflectedMirrorParameters(n_1, d_1, n_2, d_2)

% compute mirror parameters of multi reflection (mirror 1 -> mirror 2)
H_1 = computeHouseholderTransformation(n_1, d_1);
H_2 = computeHouseholderTransformation(n_2, d_2);

foot_2 = - d_2 * n_2;
foot_2_h = [foot_2; 1];

foot_12_h = H_1 *foot_2_h;

n_12 = H_1(1:3,1:3) * n_2;
d_12 = - n_12' * foot_12_h(1:3,1);

if d_12 < 0
  n_12 = - n_12;
  d_12 = n_12' * foot_12_h(1:3,1);
end

