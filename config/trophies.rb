module TrophyWife

  attr_accessor :trophies, :trophy_dir

  @@trophies = []

  @@trophy_dir = ""

  TrophyWife.trophy_dir = Rails.root + File.expand_path("app","trophies")

  TrophyWife.trophy_dir.each do |trophy|
    require trophy
  end

end


  
