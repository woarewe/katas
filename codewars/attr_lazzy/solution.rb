module AttrLazy
  def attr_lazy(name, &block)
    var_name = '@' + name.to_s.delete('?')
    define_method(name) do
      instance_variable_defined?(var_name) ? instance_variable_get(var_name) : instance_variable_set(var_name, instance_eval(&block))
    end
  end
end