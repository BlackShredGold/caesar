$upper_alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
                  'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

$lower_alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                  'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

def get_message
  continue = false
  puts "This is a Caesar Cipher program. Please enter a message."

  until continue do
    puts "Message: "
    message = gets.chomp
    puts "Here is your message: #{message}"
    puts "Is this correct? (y/n): "
    answer = gets.chomp.downcase
    if answer == "y"
      continue = true
      return message
    else
      continue = false
    end
  end
end

def get_shift
  continue = false

  puts "Now enter how many letters you would like to shift your message"
  puts "(Negative numbers move backwards in the alphabet, positive forwards.):"

  until continue do
    shift_num = gets.chomp.to_i
    if shift_num == 0
      continue = false
      puts "Try again:"
    else
      puts "Is a shift of #{shift_num} correct? (y/n)"
      answer = gets.chomp.downcase
      if answer == "y"
        continue = true
        return shift_num
      else
        continue = false
        puts "Try again:"
      end
    end
  end  
end

def get_letter_index(letter)
  upper_index = $upper_alphabet.index(letter)
  lower_index = $lower_alphabet.index(letter)
  
  if upper_index == nil && lower_index == nil
    return nil
  elsif upper_index == nil
    return lower_index
  else
    return upper_index
  end
end

def is_capital(letter)
  upper = $upper_alphabet.index(letter)
  lower = $lower_alphabet.index(letter)
  
  if upper == nil && lower == nil
    return nil
  elsif upper == nil
    return false
  else
    return true
  end
end

def caesar(string, shift)
  ciphered_message = ""
  string.each_char do |letter|
    index = get_letter_index(letter)
    if index != nil
      new_index = index + shift
      while new_index > 25
        new_index -= 26
      end
      while new_index < -25
       new_index += 26
      end
      if is_capital(letter)
        ciphered_message << $upper_alphabet[new_index]
      else
        ciphered_message << $lower_alphabet[new_index]
      end
    else
      ciphered_message << letter
    end
    
  end
  puts "Here is your encoded message: #{ciphered_message}"
end

caesar(get_message, get_shift)