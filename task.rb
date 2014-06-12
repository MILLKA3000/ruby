class Task1_1
  def initialize()
    @mas = Array.new(4) { Array.new(4){|x| rand(-10..10)}}
  end

  def view
    sum=0
    @mas.each do |i|
      i.each do |j|
        if j<0
          print "#{j} "
          sum+=j
        end
      end
      puts
    end
    puts "\n#{sum}"
  end
end

# Task2

class Task1_2
  def initialize()
    time = Time.now
    @mas = Array.new(40) { |x|
      rand((time - 60*60*24*365)..time).strftime("%d.%m").to_s+" "+rand(-40..40).to_s
    }
  end

  def splits(str)
    temperature_date = str.split
    sp = temperature_date[0].split(".")
    sp[2]=temperature_date[1]
  end

  def view
    date,sum,ser = [],[],[]
    @mas.each_with_index do |j,i|
      date[i] = splits(j)
      d1=date[i][1].to_i
      d2=date[i][2].to_i
      if sum[d1]
        sum[d1] += d2
        ser[d1] += 1
      else
        sum[d1] = d2
        ser[d1] = 1
      end
    end
    for i in 1..12
      if sum[i] and sum[i]!=0
        puts sum[i]/ser[i]
      else
        puts "0"
      end
    end
  end
end

# Task3

class Task1_3
  def initialize
    @h = {'yes' => 23,'b' => 'travel','yesterday' => 34,5=> '234', :yesss => :fg,try: 30, key: 'some value','yesterday1' => 34,'yesteryear' => 2014}
  end
  def view
    sum = 0
    @h.each do |i,j|
      sum += 1 if i.to_s.downcase.start_with?('yes')
    end
    puts sum
  end
end

# Task4

class Task1_4
  def initialize
    @h = {'yes' => 23,
        'b' => 'travel',
        'yesterday' => 34,
        5 => '234',
        :yesss => :fg,
        try: {'yesterday1'=>34, 'yesteryear' => 2014},
        key: [{'yes' => 23, 'b' => 'travel'}],
        'yesterday1' => 34,
        'yesteryear' => 2014
    }
  end
  def view(hash)
    result = {}
    hash.map do |key,value|
      if value.is_a? (Hash)
        value = view(value)
      elsif value.is_a? (Array)
        value.each_with_index do |i,j|
          value = [view(i)]
        end
      end
      result[key.to_s.to_sym]=value
    end
    result
  end
end


# for task1
# t1 = Task1_1.new
# t1.view



# for task2
# t2 = Task1_2.new
# t2.view

# for task3
# t3 = Task1_3.new
# t3.view

# for task4
# t4 = Task1_4.new
# puts t4.view(t4.instance_variable_get :@h)
