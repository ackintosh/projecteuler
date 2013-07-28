p (1...1000).inject(0) { |sum, n|  if (n % 3 == 0 || n % 5 == 0) then sum += n else sum end }
