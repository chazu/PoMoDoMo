class EasyTrophy < TrophyWife::TrophyBase

  def self.merited?(user)
    true
  end

  def text
    "You won a trophy for being alive!"
  end

  def value
    5
  end

end
