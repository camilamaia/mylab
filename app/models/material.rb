class Material < ActiveRecord::Base
  actable

  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  def calculate_description params
    params.except('name').reduce('') do |res, nxt|
      first = nxt.first
      second = nxt.second
      case first
      when 'ufsc_id'
        first = 'código ufsc'
      when 'quantity'
        first = ''
        second = "#{nxt.second} un"
      end
      res + "#{first} #{second} "
    end
  end

  def route_path
    "#{self.actable_type.downcase}_path"
  end

  def edit_path
    "edit_#{route_path}"
  end
end
