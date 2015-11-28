module UPresenter
  class CollectionBase < SimpleDelegator
    attr_reader :collection

    def initialize(collection, presenter_class, view_context = nil)
      @collection = collection
      @presenter_class = presenter_class
      @view_context = view_context

      assign_presented
      super(@collection)
    end

    class << self
      alias_method :present, :new
    end

    private

    def present_collection
      @present_collection ||= @collection.map do |object|
        @presenter_class.present(object, @view_context)
      end
    end

    def assign_presented
      @collection.class.send(:define_method, "presented") { present_collection }
    end
  end
end
