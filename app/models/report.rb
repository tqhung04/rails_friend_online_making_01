class Report < ApplicationRecord
  belongs_to :user
  scope :select_report, -> {
    select("reports.*, users.name as name, users.avatar as avatar,
      users.is_blocked as is_blocked, users.id as user_id")}
  scope :join_with_user, -> {joins("INNER JOIN users ON users.id = reports.reported_id")}
  scope :get_unique_reported, -> {joins("INNER JOIN users ON users.id = reports.reported_id").
    select("COUNT(reports.reported_id) AS total, users.*").
    group("reports.reported_id, users.id")}
  scope :where_reported_id, ->(reported_id) {
    where("reports.reported_id = ?", reported_id)
  }
  ATTRIBUTES_PARAMS = %i(user_id reported_id description).freeze
  validates :reported_id, presence: true
  validates :user_id, presence: true
  validates :description, length: {maximum: Settings.maximum.length_report_description}, allow_nil: true
  validates_uniqueness_of :user_id, scope: :reported_id
end
