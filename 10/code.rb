require 'test/unit'
require 'pry'

class EulerTest < Test::Unit::TestCase
  def test_all_primes_bellow
    assert_equal([2, 3, 5, 7], Euler.all_primes_bellow(10))
  end
end

class Euler
  def self.all_primes_bellow(num)
    primes = [2]
    list = []
    (3..num).step(2) {|n| list << n}

    while list.first <= Math.sqrt(num) do
      primes << list.shift
      del = []
      (primes.last..num).step(primes.last) {|d| del << d}
      list -= del
    end

    primes + list
  end
end

p Euler.all_primes_bellow(2000000).inject(0) {|sum, num| sum += num}
