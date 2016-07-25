class SampleObject
  attr_reader :a, :b

  def initialize(args)
    @a = args[:a]
    @b = args[:b]
  end

  def to_s
    "#{a} #{b}"
  end

  def length
    nil
  end
end

class ViewContext
  def fancy_helper
    "fancy"
  end
end

class SamplePresenter < UPresenter::Base
  def length
    object.a.size + object.b.size
  end

  def personal(name)
    "#{object.a}, #{name}"
  end
end
