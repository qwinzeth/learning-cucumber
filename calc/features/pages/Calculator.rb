class Calculator
  def push(n)
    @args ||= []
	@args << n
  end
  
  def add()
	result = 0
	@args.each do |carg|
	  result += carg
	end
	@args = []
	return result
  end

  def multiply()
	result = 1
	@args.each do |carg|
	  result *= carg
	end
	@args = []
	return result
  end
end