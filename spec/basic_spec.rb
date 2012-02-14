require File.dirname(__FILE__) + '/../lib/simple.rb'

describe "basic tests" do
  it "can create instance" do
    inst = MyClass.new
    inst.should_not be_nil
  end
  it "defaults name" do
    inst = MyClass.new
    inst.name.should == "default"
  end
  it "has a class method" do
    MyClass.a_class_method.should match("default class impl")
  end
  it "has an instance method" do
    inst = MyClass.new
    inst.an_instance_method.should match("default instance impl for default")
  end
  it "can set name" do
    inst = MyClass.new("hello")
    inst.name.should == "hello"
  end
end

describe "stub methods" do
  it "can stub class methods" do 
    MyClass.stub(:a_class_method).and_return("a stubbed method")
    MyClass.a_class_method.should match("a stubbed method")
  end

  it "should not persist class method stubs between blocks" do
    MyClass.a_class_method.should match("default class impl")
  end

  it "invoking stub on class does not affect instance methods" do
    MyClass.stub(:an_instance_method).and_return("a stubbed method")
    inst = MyClass.new
    inst.an_instance_method.should match("default instance impl for default")
  end
  it "can stub instance methods" do
    MyClass.any_instance.stub(:an_instance_method).and_return("a stubbed instance method")
    inst = MyClass.new
    inst.an_instance_method.should match("a stubbed instance method")
  end
end
