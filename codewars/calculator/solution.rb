class Calculator
  def evaluate(string)
    Kernel.class_eval(string.gsub(/(\d+)/, '\1' + '.to_f'))
  end
end
