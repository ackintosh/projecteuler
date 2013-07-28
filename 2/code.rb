
def fib(n)
  return 0 if n < 1
  return 1 if n == 1
  return 2 if n == 2
  return fib(n - 1) + fib(n - 2)
end

n = 1
result = 0
f = 0
while (f < 4000000) do
  f = fib(n)
  result += f if f % 2 == 0
  n += 1
end

p result
