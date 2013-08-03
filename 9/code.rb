def pt1?(a, b, c)
  return true if (a ** 2) + (b ** 2) == (c ** 2)
  false
end

def pt2?(a, b, c)
  return true if a + b + c == 1000
  false
end


def pythagorean
  a = 1
  loop do
    b = a + 1
    while (a + b < 1000)
      c = 1000 - a - b
      return a, b, c if pt1?(a, b, c) && pt2?(a, b, c)
      b += 1
    end
    a += 1
    if a == 1000
      puts 'something wrong.'
      abort
    end
  end
end

p pythagorean.inject(1) { |answer, n| answer *= n }
