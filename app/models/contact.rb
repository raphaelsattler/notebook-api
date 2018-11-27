class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  has_many :phones

  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def kind_description
  #   kind.description
  # end

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    h
  end
end
