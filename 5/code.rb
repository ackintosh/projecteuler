require 'pry'

class Array
  def flat?
    self.each do |n|
      return false unless first == n
    end
    true
  end
end

def lcm(a, b)
  ar1 = [a, b]
  ar2 = ar1.dup
  while ar1.flat? == false do
    index_of_min = ar1.index(ar1.min)
    ar1[index_of_min] += ar2[index_of_min]
  end
  ar1.first
end

n = 1
(1..20).each do |i|
  n = lcm(n, i)
end

p n
