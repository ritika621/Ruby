class PhoneBook

def initialize
  @phoneEntries = Hash.new
  @nameEntries = Hash.new
  end

def add(name, number, is_listed)
  digit = ''
  returnVal = true
  numberArray=number.chars
  if @nameEntries.key?(name) == true
    returnVal = false
  else 
    for j in (0..11)
      if j == 3 || j == 7
        digit = numberArray[j]
        if digit != '-'
          returnVal = false
        end
      else
        digit = numberArray[j]
        if (digit.to_i < 1 || digit.to_i > 9) && digit != '-' && digit != '0'
          returnVal = false
        end
      end
    end
  end
  if @phoneEntries.key?(number) ==  true
    if @phoneEntries[number] == true && is_listed == true
      returnVal = false
    end
  end
  if returnVal != false
      @nameEntries.store(name, number)
      @phoneEntries.store(number, is_listed)
    end
  returnVal
end

    def lookup(name)
      if @nameEntries.key?(name) != nil
        if @phoneEntries[@nameEntries[name]] == true
         @nameEntries[name]
        else
          nil
        end
      else
        nil
      end
    end

    def lookupByNum(number)
      if @phoneEntries.key?(number) != nil
        if @phoneEntries[number] == true
          @nameEntries.key(number)
        else
          nil
        end
      end
    end

    def namesByAc(areacod)
      returnArray = Array.new
      areaCodeArray=Array.new
      phoneNumbers= Array.new
      phoneDigits = Array.new
      areaCodeArray = areacod.chars
      phoneNumbers = @phoneEntries.keys
      phoneString = ""            
      count = 0;
      j = 0

      k = 0
      i =0

             
     for i in (0..@phoneEntries.length())
       phoneString = phoneNumbers[i].to_s
       phoneDigits = phoneString.chars
          
     for j in (0..2)
       if areaCodeArray[j] == phoneDigits[j]
         count += 1;
         end
        end
       if count == 3
         returnArray[k] = @nameEntries.key(phoneNumbers[i])
         k += 1
        end
          count = 0
     end
     returnArray
    end

end
