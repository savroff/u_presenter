require "spec_helper"
require_relative "fixtures/base"

describe UPresenter::Base do
  subject { SamplePresenter.present(object, view_context) }

  let(:view_context) { ViewContext.new }
  let(:object) { SampleObject.new(a: "Hello", b: "World") }

  it "return method object" do
    expect(subject.a).to eq("Hello")
  end

  it "override object method with presenter method" do
    expect(subject.lenght).to eq(object.a.size + object.b.size)
  end

  it ""
end
