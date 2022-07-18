class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :end, presence: true
    validates :memo, length: { maximum: 30 }

    validate :start_end_check

    def start_end_check
        if self.end < self.start
            errors.add(:end, "は開始日より前の日付は登録できません")
        end
    end

end
