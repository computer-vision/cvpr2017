function p_out = removeDiscontinuedPoints(p_in, ns, ds, m_id)

p_discontinued = [i, i, i];

p_out = [];

for i_p = 1:size(p_in, 1)
  is_discontinued = checkDiscontinuity(p_in(i_p,:), ns, ds, m_id);
  if is_discontinued
    p_out = [p_out; p_discontinued];
  else
    p_out = [p_out; p_in(i_p,:)];
  end
end
