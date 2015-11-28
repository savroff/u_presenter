require "spec_helper"
require_relative "fixtures/base"

describe UPresenter::Base do

  describe "#present" do
    subject { SamplePresenter.present(object, view_context) }

    let(:view_context) { ViewContext.new }
    let(:object) { SampleObject.new(a: "Hello", b: "World") }

    it "return object method value" do
      expect(subject.a).to eq(object.a)
    end

    it "override object method with presenter method" do
      expect(subject.lenght).to eq(object.a.size + object.b.size)
    end

    it "add presenter method to object" do
      name = 'Fedor'
      expect(subject.personal(name)).to eq("#{object.a}, #{name}")
    end

    it "have access to view_context helper" do
      expect(subject.view_context.fancy_helper).to eq(view_context.fancy_helper)
    end
  end

  describe "#present_collection" do
    it "return decorated records" do
    end

    it "allow access to any collection methods" do
    end
  end
end
