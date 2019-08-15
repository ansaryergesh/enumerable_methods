class Hello
    # We are inside the body of the class, so `self`
    # refers to the current instance of `Class`
    p self
  
    def foo
        # We are inside an instance method, so `self`
        # refers to the current instance of `Hello`
        return self
    end

    def self.bar
        return self
      end
    end

    h = Hello.new
    p h.foo
    p Hello.bar