class Employee < ApplicationRecord
    has_many :projects, dependent: :destroy
    validates :name, :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { :with => /[a-z0-9]+[@][a-z]+[.][a-z]+{2,4}/, :message => "is not valid" }
    validates :phone, length: { :is => 10 }
    validates :age, numericality: { :greater_than_or_equal_to => 18, :less_than_or_equal_to => 62}
    validates :phone, uniqueness: true


    before_validation :generate_emp_code
    after_save :create_log

    def generate_emp_code
        fullname = self.name.split()
        if fullname.length == 1
            self.emp_id = "#{self.name[0,2]}#{rand(0...10)}#{rand(0...10)}#{rand(0...10)}"
        else
            self.emp_id = "#{fullname[0][0]}#{fullname[1][0]}#{rand(0...10)}#{rand(0...10)}#{rand(0...10)}"
        end
    end

    def create_log
        logger.info("Employeee with ID: #{self.emp_id} Has been Created Succesfully!")
    end

end
