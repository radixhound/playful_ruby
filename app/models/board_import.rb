# == Schema Information
#
# Table name: board_imports
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BoardImport < ApplicationRecord
  has_one_attached :file

  after_initialize :set_default_status, if: :new_record?
  after_create :start_import_job
  after_update_commit :broadcast_status_change

  private

  def set_default_status
    self.status ||= 'pending'
  end

  def start_import_job
    BoardImportJob.perform_later(self.id)
  end

  def broadcast_status_change
    broadcast_replace_to "board_imports", partial: "board_imports/board_import", locals: { board_import: self }, target: "board_import_#{id}"
  end
end
