class Material < ActiveRecord::Base
  actable

  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  def material_id
    self.id
  end

  def friendly_description all_attributes
    all_attributes.except('name').reduce('') do |description, (attr_name, attr_value)|
      unless attr_value.nil? || attr_value.empty?
        description = description + attr_friendly_description(attr_name, attr_value)
      end
      description
    end.chomp(", ")
  end

  def attr_friendly_description name, value
    case name
    when 'ufsc_id'
      "código ufsc: #{value}, "
    when 'quantity'
      "#{value} un, "
    when 'capacity'
      "capacidade #{value}, "
    when 'concentration'
      "concentração #{value}, "
    else
      "#{name} #{value}, "
    end
  end

  def name_with_description
     "#{name}, #{description}"
  end

  def route_path
    "#{self.actable_type.underscore}_path"
  end

  def edit_path
    "edit_#{route_path}"
  end
end
