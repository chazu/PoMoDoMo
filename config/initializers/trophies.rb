module TrophyWife
  
  attr_accessor :trophies, :trophy_dir
  
  @@trophies = []
  @@trophy_dir = File.join(Rails.root, "app", "trophies", "*.rb")

  def self.load_trophies
    existing_classes = ObjectSpace.each_object(Class).to_a
    Dir[@@trophy_dir].each do |trophy|
      require trophy
    end
    @@trophies = ObjectSpace.each_object(Class).to_a - existing_classes
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

    def self.smelt_trophy(trophy)
      Trophy.create(:value => trophy.value, :text => trophy.text, :name => trophy.name)
    end

    def self.award_if_merited(user, trophy)
      user.trophies <<(smelt_trophy(trophy)) if trophy.merited?(user) and not user.trophies.where(:name => trophy.name).nil?
    end

    def self.officiate(user)
      TrophyWife.trophies.each do |trophy|
        self.award_if_merited(user, trophy)
      end
    end

  end
end

TrophyWife.load_trophies
