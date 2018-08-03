require 'zip'
class Task < ApplicationRecord
  mount_uploader :file, TaskUploader

  belongs_to :user
  belongs_to :environment

  def files
    result = []
    return result unless file_url.present?
    Zip::File.open(Task.last.file.path) do |zipfile|
      zipfile.each do |entry|
        next unless entry.name.split('.').last == environment&.file_extension
        result << entry.name
      end
    end
    result
  end

  validates :file, presence: true, unless: :file_errors_exist?

  private

  def file_errors_exist?
    errors[:attachment].present?
  end
end
