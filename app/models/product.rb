require 'csv'

class Product < ApplicationRecord
  VISIBLE_FIELDS = [
    :product_category, :value, :product_name, :vendor,
    :phone, :customer_name, :zip_code, :city, :street 
  ]

  scope :periphery, -> { where.not(city: ['Москва', 'Санкт-Петербург']) }
  
  
  def self.load(file)
    destroy_all

    CSV.foreach(file.tempfile, :headers => true, :col_sep => ';') do |unstripped|
      row = {}
      unstripped.each { |k, v| row[k.strip] = v.strip }
      create(row.to_hash)
    end
  end
end
