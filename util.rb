module Util
  def Util.to_ordinal(from_ascii)
    # e.g. to_ordinal('A') returns 1
    # reverses to_ascii, below
    from_ascii.downcase.ord - "a".ord + 1 # + 1 because ascii is zero-based
  end

  def Util.to_ascii(from_ordinal)
    # e.g. to_ascii(1) returns 'a'
    # reverses to_ordinal, above
    (from_ordinal + "a".ord - 1).chr # - 1 because ascii is zero-based
  end
end