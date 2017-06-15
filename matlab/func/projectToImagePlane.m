function q = projectToImagePlane(p, A)

q_tmp = A * p';

for i = 1:size(p,1)
  q_h(i,:) = (q_tmp(:,i) / q_tmp(3,i))';
end

q = q_h(:,1:2);