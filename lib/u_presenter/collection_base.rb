module UPresenter
  class CollectionBase < SimpleDelegator
    attr_reader :presenter_collection
    
    def initialize(collection, view_context, presenter_class)
      @view_context = view_context
      @presenter_collection = present_objects(collection, presenter_class)
      super(@presenter_collection)
    end

    private

    def present_objects(collection, presenter_class)
      collection.map { |object| presenter_class.present(object) }
    end
  end
end
