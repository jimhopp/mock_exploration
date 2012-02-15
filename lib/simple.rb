class MyClass

  attr_accessor :name

  def initialize(name="default")
    @name = name
  end

  def self.a_class_method
    "default class impl"
  end

  def an_instance_method
    "default instance impl for #{@name}"
  end

  def one_parm_instance_method(arg)
    "default instance impl for #{@name} invoked with #{arg}"
  end

end
