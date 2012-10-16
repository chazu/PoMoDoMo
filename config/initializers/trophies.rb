module TrophyWife

  attr_accessor :trophies, :trophy_dir

  @@trophies = []
  @@trophy_dir = Rails.root + File.expand_path("app","trophies")

  Dir[@@trophy_dir].each do |trophy|
    require trophy
    @@trophies << trophy
  end

  def self.trophies
    @@trophies
  end

  class TrophyBase

    def self.merited?(user)
      false
    end

    def self.text
      ""
    end

    def self.value
      5
    end

    def name
      ""
    end

  end

  class TrophyOfficial
    
    def self.instance
      @@instance ||= TrophyOfficial.new
    end

    def smelt_trophy(trophy)
      Trophy.create(:value => trophy.value, :text => trophy.text, :name => trophy.name)
    end

    def award_if_merited(user, trophy)
      user.trophies << smelt_trophy(trophy) if trophy.merited?(user) && not user.trophies.where(:name => trophy.name).nil?
    end

    def officiate(user)
      TrophyWife.trophies.each do |trophy|
        award_if_merited(user, trophy)
      end
    end

  end
end
