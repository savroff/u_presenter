module UPresenter
  class Base < SimpleDelegator
    attr_reader :object, :view_context

    def initialize(object, view_context)
      @object = object
      @view_context = view_context
      super(@object)
    end

    class << self
      alias_method :present, :new

      def present_collection(collection, view_context)
        CollectionPresenter.present(collection, view_context, self)
      end
    end
  end
end
