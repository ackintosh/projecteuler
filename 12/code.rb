require 'pry'
require 'test/unit'

class Fixnum
  def prime?
    return false if self < 2

    (2..(Math.sqrt(self))).each do |n|
      return false if self % n == 0
    end
    true
  end

  def prime_factors
    return [] if self < 2
    factors = []

    n = 2
    number = self
    begin
      if n.prime?
        quot, rem = number.divmod(n)
        if rem == 0
          factors << n
          number = quot
          n = 2
        else
          n += 1
        end
      else
        n += 1
      end
    end while !(quot == 1 && rem == 0)
    factors
  end

  def divisor_count
    factors = prime_factors
    divisors = []
    factors.each do |n|
      if divisors[n] == nil
        divisors[n] = 1
      else
        divisors[n] += 1
      end
    end
    result = 1
    divisors.each do |n|
      next if n == nil
      result *= n + 1
    end
    result
  end

  def triangle_number
    result = 0
    (1..self).each { |n| result += n }
    result
  end
end

class FixnumTest < Test::Unit::TestCase
  def test_prime?
    assert_equal(false, 1.prime?)
    assert_equal(true, 2.prime?)
    assert_equal(false, 10.prime?)
    assert_equal(true, 13.prime?)
  end

  def test_prime_factors
    assert_equal([], 1.prime_factors)
    assert_equal([2], 2.prime_factors)
    assert_equal([2, 2], 4.prime_factors)
    assert_equal([2, 2, 3], 12.prime_factors)
  end

  def test_divisor_count
    assert_equal(1, 1.divisor_count)
    assert_equal(2, 3.divisor_count)
    assert_equal(4, 6.divisor_count)
    assert_equal(4, 10.divisor_count)
    assert_equal(4, 15.divisor_count)
    assert_equal(4, 21.divisor_count)
    assert_equal(6, 28.divisor_count)
  end

  def test_triangle_number
    assert_equal(1, 1.triangle_number)
    assert_equal(3, 2.triangle_number)
    assert_equal(6, 3.triangle_number)
    assert_equal(10, 4.triangle_number)
    assert_equal(15, 5.triangle_number)
    assert_equal(21, 6.triangle_number)
    assert_equal(28, 7.triangle_number)
  end
end

if __FILE__ == $0
  answer = nil
  n = 1
  while true
    t = n.triangle_number
    if t.divisor_count > 500
      answer = t
      break
    end
    n += 1
  end

  p answer
end
