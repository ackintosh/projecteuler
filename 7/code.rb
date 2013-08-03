class Fixnum
  def prime?
    return false if self < 2
    (2..(Math::sqrt(self)).to_i).each do |n|
      return false if self % n == 0
    end
    true
  end

  def st_prime_number
    n = 1
    prime_count = 0
    loop do
      prime_count += 1 if n.prime?
      return n if prime_count == self
      n += 1
    end
  end
end

p 10001.st_prime_number
