
class Fixnum
  def palindrome?
    return self.to_s == self.to_s.reverse
  end
end

def largest_palindrome
  result = []

  (100..999).each do |n|
    (n..999).each do |m|
      product = n * m
      if product.palindrome?
        result << product
        break
      end
    end
  end

  result
end

p largest_palindrome.max
