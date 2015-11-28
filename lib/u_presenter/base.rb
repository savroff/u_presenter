module UPresenter
  class Base < SimpleDelegator
    attr_reader :object, :view_context

    def initialize(object, view_context = nil)
      @object = object
      @view_context = view_context
      super(@object)
    end

    class << self
      alias_method :present, :new

      def present_collection(collection, view_context)
        CollectionBase.present(collection, self, view_context)
      end
    end
  end
end
