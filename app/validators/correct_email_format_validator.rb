class CorrectEmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    if value != nil
    record.errors[attribute] << "Email is not valid." unless value.include? "@"
    end
  end
end
