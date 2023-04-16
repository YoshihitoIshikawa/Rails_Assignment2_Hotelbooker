class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_people, presence: true
  validate :number_of_stay
  validate :number_of_people_proper?

  def number_of_stay
    if check_in != nil && check_out != nil
      if check_in >= check_out
      errors.add(:check_out,"はチェックイン日以降の日付を選択してください。")
      end
    end
  end

  def number_of_people_proper?
    if number_of_people < 1
      errors.add(:number_of_people,"は1以上の数字(半角)で入力してください。")
    end
  end
end
