class CsvImport
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Paperclip::Glue
  extend ActiveModel::Callbacks

  attr_accessor :csv_file_name, :csv_file_size, :csv_content_type
  define_model_callbacks :save, only: [:after]
  define_model_callbacks :destroy, only: [:before, :after]

  has_attached_file :csv
  validates :csv, presence: true

  def initialize(attributes={})
     attributes.each{|name, value| send("#{name}=", value) } unless attributes.blank?
   end

   def persisted?
   	false
   end
end
