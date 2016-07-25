module UPresenter
  class CollectionBase < SimpleDelegator
    attr_reader :collection

    def initialize(collection, presenter_class, view_context = nil)
      @collection = collection
      @presenter_class = presenter_class
      @view_context = view_context
      super(@collection)
    end

    def presented
      @presented ||= present_collection
    end

    class << self
      alias_method :present, :new
    end

    private

    def present_collection
      @collection.lazy.map do |object|
        @presenter_class.present(object, @view_context)
      end
    end
  end
end
