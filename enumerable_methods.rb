
module Enumerable

    def my_each
      i = 0
      while i < self.length do
        yield self[i]
        i+=1
      end
    end



    def my_each_with_index
      i = 0
      while i < self.length do
        yield self[i], i
        i+=1
      end
    end



    def my_select
      i=0
      result = []
      while i < self.length do
        if (yield self[i])
          result << self[i]
        end
        i+=1
      end
      result
    end


    def my_all?
      result = true
      i=0
      while i < self.length do

        if !yield(self[i])
          result = false
        end
        i+=1
      end
      result

    end

    def my_any?
      result = false
      i=0
      while i < self.length do

        if yield(self[i])
          result = true
        end
        i+=1
      end
      result

    end





    def my_none?
      result = true
      i = 0
      while i < self.length do
        if yield(self[i])
          result = false
        end
        i+=1
      end
      result
    end



    def my_count

      this_many = 0
      i = 0

      while i < self.length do
        if yield(self[i])
          this_many +=1
        end
        i +=1
      end

      this_many

    end


=begin
    def my_map
      i = 0
      result = []
      while i < self.length do
        result << yield(self[i])
        i+=1
      end
      result

    end


=end
#my_map modified to take either a proc or a block, execute the block only if both
#are supplied


      def my_map(&map_proc)


            i = 0
            result = []
            while i < self.length do


                    if block_given?
                    result << yield(self[i])
                    else
                    result << map_proc.call(self[i])
                    end
                    i+=1

            end
            result

      end



    def my_map_proc(&this_proc)
      i = 0
      result = []
      while i < self.length do
        result << this_proc.call(self[i])
        i+=1
      end
      result

    end


    def my_inject(val=0)
      i = 0
      result = 0
      while i < self.length do
        result = yield(result, self[i])
        i+=1
      end
      result

    end

    def multiply_els(val=1)
      i = 0
      result = 1
      while i < self.length do
        result = yield(result, self[i])
        i+=1
      end
      result

    end


end

#[1,2,3,4].my_each {|i| puts i}
#[1,2,3,4].my_each_with_index {|v, i| puts v, i}
#puts [1,2,3,4].my_select {|v| v>2}
#puts [11,23,3,4].my_all? {|v| v>2}
#puts [11,23,3,4,2].my_any? {|v| v==2}
#puts [11,23,3,4,2].my_none? {|v| v==200}
#puts [11,23,3,2,2,4,2].my_count {|v| v==2}
#puts [11,23,3,2,2,4,2].my_map {|v| v*2}
#puts [11,23,3,2,2,4,2].my_inject(0) {|result, element| result + element }
#puts [2,4,5].multiply_els {|result, element| result * element }

this_proc = Proc.new {|v| v + 1}
map_proc = Proc.new {|v| v + 1}

puts [11,23,3,2,2,4,2].my_map {|p| p + 4}
#[1,2,3,4].test_this
