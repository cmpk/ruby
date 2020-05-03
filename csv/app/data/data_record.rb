require 'active_record'
require 'ipaddr'
require_relative './data_message'

class DataRecord
  include ActiveModel::Model
  attr_accessor :column_size, :date, :title, :count, :ip_address, :notes

  validates :column_size, numericality: {equal_to: 5}
  validates :count, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999, message: $validation_count_message}

  validate :validate_date
  validate :validate_ip_address

  private

  def validate_date
    begin
      Date.parse date if ! date.nil? && ! date.empty?  # Rails を利用しているのであれば blank? 一発
    rescue ArgumentError
      errors.add(:base, $validation_date_message.gsub(/%{value}/, ip_address))
    end
  end

  def validate_ip_address
    begin
      IPAddr.new(ip_address) if ! ip_address.nil? && ! ip_address.empty?  # Rails を利用しているのであれば blank? 一発
    rescue ArgumentError
      errors.add(:base, $validation_ip_address_message.gsub(/%{value}/, ip_address))
    end
  end
end

