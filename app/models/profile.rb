class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, :last_name, presence: true
  
  validate :validate_gender

    def validate_gender
    	validates :gender, inclusion: { in: %w(male female),
    message: "Gender has not the right value" }
    end
validate :lastname_xor_firstname

  private

    def lastname_xor_firstname
      unless last_name.blank? ^ first_name.blank?
        errors.add(:base, "Specify a last_name or a first_name, not both")
      end
    end

  # validates :first_name, allow_nil: true , if: "last_name.present?"
  #validates  :last_name, presence: true, 
  #			 if: :first_name, allow_blank: true
  #validates_presence_of :mobile_number, :unless => :home_phone?
  #validates :first_name, presence: false, :last_name, presence: true 
  #validates :last_name, presence: true, if: "last_name.nil?"
end
