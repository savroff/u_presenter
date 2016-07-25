require "spec_helper"
require_relative "fixtures/base"

describe UPresenter::Base do
  let(:view_context) { ViewContext.new }
  let(:object) { SampleObject.new(a: "Hello", b: "Mars") }

  describe "#present" do
    subject { SamplePresenter.present(object, view_context) }

    it "return object method value" do
      expect(subject.a).to eq(object.a)
    end

    it "override object method with presenter method" do
      expect(subject.length).to eq(object.a.size + object.b.size)
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
    subject { SamplePresenter.present_collection(objects, view_context) }
    let(:view_context) { ViewContext.new }
    let(:objects) { [object, object] }

    it "return collection object" do
      expect(subject).to be_instance_of(UPresenter::CollectionBase)
    end

    it "allows to skip view context in parameters" do
      expect(SamplePresenter.present_collection(objects))
        .to be_a UPresenter::CollectionBase
    end
  end
end
