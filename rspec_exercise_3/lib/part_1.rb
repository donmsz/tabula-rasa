def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def nth_prime(num)
    primes = []
    i = 2
        while primes.length < num
            if is_prime?(i)
                primes << i
            end
            i += 1
        end
    primes[num - 1]
end

def prime_range(min, max)
    primes = []
    (min..max).each do |i|
        if is_prime?(i)
            primes << i 
        end
    end
    primes
end