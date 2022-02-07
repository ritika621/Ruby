def fib(n)
  fibArray = []
  if n >= 1
    fibArray[0] = 0
  end
  if n >= 2
      fibArray[1] = 1
   end
   if n >= 3
     for m in (2..n-1)
        fibArray[m] = fibArray[m-1] + fibArray[m-2]
     end
   end
    fibArray
end
  
def isPalindrome(n)
  stringNumber = n.to_s
  reverse = stringNumber.reverse
  if stringNumber == reverse
    true
  else
    false
  end
end

def nthmax(n, a)
  if n < a.length
    for i in (0..a.length-2)
      for j in (0..a.length-i-2)
        if a[j] > a[j + 1]
          storage = a[j]
          a[j] = a[j +1]
          a[j+1] = storage
        end
      end
    end
    a[a.length - 1 -n]
  else
    nil
  end
end

def freq(s)
  hashMap = Hash.new
  stringArray = Array.new
  stringArray = s.chars.sort
  j = 0
  count = Array.new

  if stringArray.length > 0
    for i in (1..stringArray.length-1)
      if hashMap[stringArray[j]] == nil
        hashMap[stringArray[j]] = 1
      end
    if stringArray[i] == stringArray[i-1]
      hashMap[stringArray[j]] += 1;
    else
      j += 1;
    end
  
    end
    count = hashMap.values.sort
    hashMap.key(count[count.length - 1])
    else
      s
   end
end      
          
def zipHash(arr1, arr2)
  returnHash = Hash.new
  if arr1.length == arr2.length
    for i in (0..arr1.length-1)
      returnHash[arr1[i]] = arr2[i]
    end
    returnHash
  else
    nil
  end
end

def hashToArray(hash)
  keyArray= Array.new
  keyArray =  hash.keys
  hashArray=Array.new
  for i in (0..hash.length-1)
    hashArray[i]=Array.new
    hashArray[i][0] = keyArray[i]
    hashArray[i][1] = hash[keyArray[i]]
  end
  hashArray
    
end
