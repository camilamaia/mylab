class Item < ActiveRecord::Base
  actable

  belongs_to :stock
  belongs_to :material

  def material_type
    self.material.actable_type
  end

  def friendly_description all_attributes
    all_attributes.except('material_id').reduce('') do |description, (attr_name, attr_value)|
      description + attr_friendly_description(attr_name, attr_value) + ', '
    end.chomp(", ")
  end

  def attr_friendly_description name, value
    case name
    when 'current_quantity'
      "quantidade atual #{value} un"
    else
      "#{name} #{value}"
    end
  end

   def route_path
    "#{self.actable_type.underscore}_path"
  end

  def edit_path
    "edit_#{route_path}"
  end
end
