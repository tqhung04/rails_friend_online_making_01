class Report < ApplicationRecord
  belongs_to :user
  scope :join_with_users, -> {joins("INNER JOIN users ON users.id = reports.reported_id").
    select("COUNT(reports.reported_id) AS total, users.*").
    group(:reported_id)}
  ATTRIBUTES_PARAMS = %i(user_id reported_id description).freeze
  validates :name, presence: true
  validates :reported_id, presence: true
  validates :description, length: {maximum: Settings.maximum.length_report_description}, allow_nil: true
end
