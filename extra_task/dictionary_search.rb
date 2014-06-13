class DictionarySearch
  def initialize(file_path)
     @all_mas = Hash[File.read(file_path).split("\r\n").map.with_index { |x, i| [x]  if x.size > 2 and x[x.size-1] != x[x.size-2]}]
  end

  def word_pairs
    words=[]
    @all_mas.each_key do |v|
       new = letter_inverse(v.to_s)
       if @all_mas.has_key?(new)
         words.push([v,new])
         @all_mas.delete(new)
       end
    end
  words
  end

  def letter_inverse(str)
    o = str
    string = str.chop.chop << o[o.size-1] << o[o.size-2]
  end
end

obj = DictionarySearch.new("wordsEn.txt")
obj.word_pairs