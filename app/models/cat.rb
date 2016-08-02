class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid cat sex" }

    def age
      months = ((Time.now.to_date - birth_date).to_i)/30
      months >= 12 ? "#{(months/12)} years" : "#{months} months"
    end
end
