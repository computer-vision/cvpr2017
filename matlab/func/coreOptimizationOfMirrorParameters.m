function F = coreOptimizationOfMirrorParameters(x, qs, A, num_of_mirror)

num_of_reflection = 2;
check_discontinuity = 1;
num_of_chamber = computeNumberOfChamber(num_of_mirror, num_of_reflection);

F = [];

for i_m = 1:num_of_mirror
  ns{i_m} = transformEulerToVector(x(3*(i_m-1)+1), x(3*(i_m-1)+2));
  ds{i_m} = x(3*(i_m-1)+3);
end
p_base = computeTriangulationWithMirrorReflection(qs, ns, ds, A, num_of_mirror);

ps = generateMirrorReflections(p_base, ns, ds, A, num_of_mirror, num_of_reflection, 0);

for i_chamber = 1:size(ps, 2)
  qs_rep{i_chamber} = projectToImagePlane(ps{i_chamber}, A);
end

for i_chamber = 1:num_of_chamber
  for i_p = 1:size(qs_rep{1},1)
    rep = power(norm(qs_rep{i_chamber}(i_p,:) - qs{i_chamber}(i_p,:)), 2);
    F = [F; rep];
  end
end