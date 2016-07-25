require "spec_helper"
require_relative "fixtures/base"

describe UPresenter::CollectionBase do
  describe "#present" do
    let(:view_context) { ViewContext.new }
    let(:mars) { SampleObject.new(a: "Hello", b: "Mars") }
    let(:venera) { SampleObject.new(a: "Hi", b: "Venera") }
    let(:objects) { [venera, mars] }
    subject { SamplePresenter.present_collection(objects, view_context) }

    it "return presented records" do
      expect(subject.presented).to all(be_a(SamplePresenter))
    end

    it "have access to original objects" do
      is_expected.to all(be_a(SampleObject))
    end
  end
end
