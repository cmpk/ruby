require 'active_record'
require 'ipaddr'

class DataRecord
  include ActiveModel::Model
  attr_accessor :column_size, :date, :title, :count, :ip_address, :notes

  validates :column_size, numericality: {equal_to: 5}
  validates :count, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999}

  validate :validate_date
  validate :validate_ip_address

  private

  def validate_date
    begin
      Date.parse date if ! date.nil? && ! date.empty?  # Rails を利用しているのであれば blank? 一
    rescue ArgumentError
      errors.add(:date, "#{date} is invalid")
    end
  end

  def validate_ip_address
    begin
      IPAddr.new(ip_address) if ! ip_address.nil? && ! ip_address.empty?  # Rails を利用しているのであれば blank? 一
    rescue ArgumentError
      errors.add(:ip_address, "#{ip_address} is invalid")
    end
  end
end

