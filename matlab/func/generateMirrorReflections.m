function ps = generateMirrorReflections(p_base, ns, ds, A, ...
    num_of_mirror, num_of_reflection, check_discontinuity)

i_chamber = 1;

% base chamber
ps{i_chamber} = p_base;
qs{i_chamber} = projectToImagePlane(p_base, A);
i_chamber = i_chamber + 1;

% first reflection
for i_m = 1:num_of_mirror

  n = ns{i_m};
  d = ds{i_m};
  p_ref = computeMirroredPointSet(p_base, n, d, A);

  ps_ref{i_m} = p_ref;
  pre_mirror_ids{i_m} = i_m;
  
  ps{i_chamber} = p_ref;
  first_mirror_ids_pre{i_chamber-1} = i_m; 

  i_chamber = i_chamber + 1;
  
end

ns_pre = ns;
ds_pre = ds;

for i_ref = 2:num_of_reflection

  i_n = 1;
  
  for i_p = 1:size(ps_ref, 2)
    p_1 = ps_ref{i_p};
    n_1 = ns_pre{i_p};
    d_1 = ds_pre{i_p};

    first_mirror_id = first_mirror_ids_pre{i_p};
    
    for i_m = 1:num_of_mirror
      
      if pre_mirror_ids{i_p} == i_m
	continue;
      end

      n_2 = ns{i_m};
      d_2 = ds{i_m};

      [n_12, d_12] = computeMultiReflectedMirrorParameters(n_1, d_1, n_2, d_2);

      p_ref = computeMirroredPointSet(p_1, n_12, d_12, A);

      ps_ref_tmp{i_n} = p_ref;
      pre_mirror_ids_tmp{i_n} = i_m;
      
      ns_pre_tmp{i_n} = n_12;
      ds_pre_tmp{i_n} = d_12;

      if check_discontinuity == 1
	% remove discontinued points
	ps{i_chamber} = removeDiscontinuedPoints(p_ref, ns, ds, first_mirror_id);
      else
	ps{i_chamber} = p_ref;
      end
	
      first_mirror_ids{i_chamber} = first_mirror_id;
      first_mirror_ids_tmp{i_n} = first_mirror_id;
      
      i_n = i_n + 1;      
      i_chamber = i_chamber + 1;
    end      
  end
  
  ps_ref = ps_ref_tmp;
  pre_mirror_ids = pre_mirror_ids_tmp;
  ns_pre = ns_pre_tmp;
  ds_pre = ds_pre_tmp;
  first_mirror_ids_pre = first_mirror_ids_tmp;
  
end
