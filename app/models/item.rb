class Item < ActiveRecord::Base
  actable

  belongs_to :stock
  belongs_to :material

  def item_id
    self.id
  end

  def material_type
    self.material ? self.material.actable_type : self.actable_type.split("Item").second
  end

  def full_description
    "#{self.material.name_with_description} - #{self.description}"
  end

  def friendly_description all_attributes
    all_attributes.except('material_id').reduce('') do |description, (attr_name, attr_value)|
      unless attr_value.nil? || attr_value.empty?
        description = description + attr_friendly_description(attr_name, attr_value)
      end
      description
    end.chomp(", ")
  end

  def attr_friendly_description name, value
    case name
    when 'current_quantity'
      "quantidade atual #{value} un, "
    when 'shelf_life(3i)'
      "validade #{value}/"
    when 'shelf_life(2i)'
      "#{value}/"
    when 'shelf_life(1i)'
      "#{value}, "
    else
      "#{name} #{value}, "
    end
  end

   def route_path
    "#{self.actable_type.underscore}_path"
  end

  def edit_path
    "edit_#{route_path}"
  end
end
