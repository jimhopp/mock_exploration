require File.dirname(__FILE__) + '/../lib/simple.rb'

describe "stub methods takes latest match" do

  it "stub selected based on arguments, no args matches specific arg " do
    MyClass.any_instance.stub(:one_arg_instance_method).with("a").and_return("got a")
    MyClass.any_instance.stub(:one_arg_instance_method).and_return("no arg matcher")
    inst = MyClass.new
    inst.one_arg_instance_method("a").should_not match("got a")
    inst.one_arg_instance_method("b").should_not match("got a")
    inst.one_arg_instance_method.should_not match("got a")
  end

  it "stub selected based on arguments, specific arg after no args" do
    MyClass.any_instance.stub(:one_arg_instance_method).and_return("no arg matcher")
    MyClass.any_instance.stub(:one_arg_instance_method).with("a").and_return("got a")
    inst = MyClass.new
    inst.one_arg_instance_method("a").should match("got a")
    inst.one_arg_instance_method("b").should_not match("got a")
    inst.one_arg_instance_method.should_not match("got a")
  end

  it "must enumerate all args" do 
    MyClass.any_instance.stub(:one_arg_instance_method).with("a").and_return("got a")
    inst = MyClass.new
    inst.one_arg_instance_method("a").should match("got a")
    expect { inst.one_arg_instance_method("b") }.to raise_error
    expect { inst.one_arg_instance_method }.to raise_error
  end

end
