module Debug
    def who_am_i?
        puts "#{self.class.name}: #{self.inspect}"
    end
end
