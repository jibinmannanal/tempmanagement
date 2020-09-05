class Seva < ApplicationRecord
   has_rich_text :instructions
   before_create :set_identification_number
   belongs_to :seva_type
   has_many :bookings
  has_and_belongs_to_many :exception_dates

      self.per_page = 9

      def set_identification_number

        # date = Time.now
        req_id = Seva.count + 1
        self.identification_number = req_id.to_s + ":" + Time.now.try(:strftime, '%d%m%Y%M%S').to_s


      end
end
