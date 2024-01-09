module ApplicationHelper
  def get_nested_value(obj, key)
    if obj.respond.to?(:key) && obj.key?(key)
      obj[key]
    elsif obj.respond.to?(:each)
      res = nil
      obj.find { |*a| res = get_nested_value(a.last, key) }
      res
    end
  end
end
