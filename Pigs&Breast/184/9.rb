m_arr = m_str.split(" ")
int_array = m_arr.map(&:to_i)

print int_array.max
print " "
print int_array.min
