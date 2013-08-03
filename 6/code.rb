
n = 100

sum = (1..n).inject(0) { |sum, num| sum += num ** 2 }
square = (1..n).inject(0) { |sum, num| sum += num } ** 2

p square - sum
