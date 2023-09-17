=begin
def maskify(string)
    string.size > 4 ? '#'*string[0..-4].size+string[-4..] : string
end

p maskify("string")
=end

=begin
def encoder(str)
    s = ''
    str.each_char{|c| s+= (str.count(c.downcase)> 1) ? '(' :  ')'}
    s
end

p encoder("din")
=end