function [ns ds] = computeMirrorParameters(qs, A, num_of_mirror)

if num_of_mirror == 2 % in case of using two mirrors

  % mirror 1
  q_0_2 = [qs{1}; qs{3}];
  q_1_12 = [qs{2}; qs{4}];
  n_0_1 = computeNormalOfMirror(q_0_2, q_1_12, A);

  % mirror 2
  q_0_1 = [qs{1}; qs{2}];
  q_2_21 = [qs{3}; qs{5}];  
  n_0_2 = computeNormalOfMirror(q_0_1, q_2_21, A);

  for i_m = 1:num_of_mirror
    ns{i_m} = [0;0;0];
    ds{i_m} = 0;
  end
    
  for i_1 = [1, -1]
    for i_2 = [1, -1]
      ns_tmp{1}= i_1 * n_0_1;
      ns_tmp{2}= i_2 * n_0_2;

      [ds_tmp, p0_tmp] = computeDistanceOfMirror(qs, ns_tmp, A);
      
      is_d_plus = 1;
      for i_m = 1:num_of_mirror
	if ds_tmp{i_m} < 0
	  is_d_plus = 0;
	end
      end	
	
      if is_d_plus == 1 && p0_tmp(3) > 0
	ns = ns_tmp;
	ds = ds_tmp;
      end
    end
  end
elseif num_of_mirror == 3 % in case of using three mirrors

  % mirror 1
  q_0_2_3 = [qs{1}; qs{3}; qs{4}];
  q_1_12_13 = [qs{2}; qs{5}; qs{6}];
  n_0_1 = computeNormalOfMirror(q_0_2_3, q_1_12_13, A);
  
  % mirror 2
  q_0_1_3 = [qs{1}; qs{2}; qs{4}];
  q_2_21_23 = [qs{3}; qs{7}; qs{8}];
  n_0_2 = computeNormalOfMirror(q_0_1_3, q_2_21_23, A);
  
  % mirror 3
  q_0_1_2 = [qs{1}; qs{2}; qs{3}];
  q_3_31_32 = [qs{4}; qs{9}; qs{10}];
  n_0_3 = computeNormalOfMirror(q_0_1_2, q_3_31_32, A);

  for i_m = 1:num_of_mirror
    ns{i_m} = [0;0;0];
    ds{i_m} = 0;
  end

  for i_1 = [1, -1]
    for i_2 = [1, -1]
      for i_3 = [1, -1]

	ns_tmp{1}= i_1 * n_0_1;
	ns_tmp{2}= i_2 * n_0_2;
	ns_tmp{3}= i_3 * n_0_3;

	[ds_tmp, p0_tmp] = computeDistanceOfMirror(qs, ns_tmp, A);

	is_d_plus = 1;
	for i_m = 1:num_of_mirror
	  if ds_tmp{i_m} < 0
	    is_d_plus = 0;
	  end
	end	
	
	if is_d_plus == 1 && p0_tmp(3) > 0
 	  ns = ns_tmp;
	  ds = ds_tmp;
	end
      end
    end
  end
end


