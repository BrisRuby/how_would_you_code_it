# Write a function to convert from normal numbers to Roman Numerals. 

class Fixnum
  BASE_CHARACTERS = {
    5 => "V",
    10 => "X",
    25 => "XXV",
    45 => "XLV",
    50 => "L",
    90 => "XC",
    140 => "CXL",
    160 => "CLX",
    400 => "CD",
    575 => "DLXXV",
    910 => "CMX",
    1025 => "MXXV",
  }

  def to_roman 
    r = self % 5
    n = self - r

    if (1..3).include?(r)
      if n == 0
        return  "I" * self 
      end
      return (n.to_roman + r.to_roman)
    elsif r == 4
      case self
        when 59
          return 50.to_roman + 9.to_roman
      end

      return "I" + (self + 1).to_roman
    end

    BASE_CHARACTERS.fetch(self)
  end
end