class Log < ApplicationRecord
  belongs_to :user

# before_create :set_start_date
# before_save :validate_date

#   def next
#   self.class.where("id > ?", id).first
# end
#
# def previous
#   self.class.where("id < ?", id).last
# end
private
    # def set_start_date
    #   self.start_date = Date.current.strftime("%Y-%m-%d")
    # end
#
#   def validate_date
#   return true unless date > Date.current
#   return false
# end

end
