function is_discontinued = checkDiscontinuity(p, ns, ds, m_id)

th = 1; % distance for each plane should have difference more than th 
dist = [];

l = (p / norm(p))';

for i_m = 1:size(ns, 2)

  n = ns{i_m};
  d = ds{i_m};

  % n'(sl) + d = 0;
  s = - 1 * d / (n'*l);

  % cross point
  x = s * l;
 
  if s > 0 % same direction
    dist = [dist; norm(x)];
  else    
    dist = [dist; 1.0e+10];
  end
end

[sorted_val sorted_index] = sort(dist, 'ascend');

if abs(sorted_val(1) - sorted_val(2)) > th && sorted_index(1) == m_id
  is_discontinued = 0;
else 
  is_discontinued = 1;
end
  
