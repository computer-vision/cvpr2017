function num_of_chamber = computeNumberOfChamber(num_of_mirror, num_of_reflection)

num_of_chamber = 1;

pre_added_chamber = 1;
for i_r = 1:num_of_reflection
  if i_r == 1
    add_chamber = num_of_mirror * pre_added_chamber;
  else
    add_chamber = (num_of_mirror - 1) * pre_added_chamber;
  end
  num_of_chamber = num_of_chamber + add_chamber;
  pre_added_chamber = add_chamber;
end

