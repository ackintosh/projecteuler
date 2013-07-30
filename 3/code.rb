require 'pry'
require 'benchmark'

class Fixnum
  def prime?
    return false if self <= 1

    (2..(Math::sqrt(self))).each do |n|
      return false if self % n == 0
    end
    true
  end

  def prime_factors
    result = []

    p = 2
    n = self
    begin
      if !p.prime?
        p += 1
        next
      end
      quot, rem = n.divmod(p)

      if rem == 0
        result << p
        n = quot
        p = 2
      else 
        p += 1
      end
    end while !(quot == 1 && rem == 0)

    result
  end
end

p 600851475143.prime_factors.last
