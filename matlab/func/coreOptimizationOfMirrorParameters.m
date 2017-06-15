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

for i_c = 1:num_of_chamber
  F = [F; norm(qs_rep{i_c} - qs{i_c})];
end
