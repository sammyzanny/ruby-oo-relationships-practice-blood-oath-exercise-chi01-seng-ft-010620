class Cult
    attr_accessor :name, :location, :slogan, :minimum_age
    attr_reader :founding_year

    @@all = []

    def initialize(name, location, founding_year, slogan, age_rec = 0)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year
        @minimum_age = age_rec
        @@all << self
    end

    def recruit_follower(follower)
        follower.age >= minimum_age ? BloodOath.new(self,follower) : (p "Get this kid outta hea")
    end

    def cult_population
        BloodOath.all.select{|oath| oath.cult == self}.length
    end

    def self.all
        @@all
    end

    def self.find_by(by, thing)
        self.all.select{|cult| (cult.send by) == thing}
    end

    # self.findbyname(loc)
    # self.all.select{|cult| cult.location == loc}

    def self.find_by_name(nam)
        self.find_by(:name, nam)
    end

    def self.find_by_location(loc)
        self.find_by(:location, loc)
    end

    def self.find_by_founding_year(yr)
        self.find_by(:founding_year, yr)
    end

    def followers
        BloodOath.all.select{|oath| oath.cult == self}.map{|oath| oath.follower}
    end

    def average_age
        followers.reduce{|sum, follower| sum + follower.age}/followers.length
    end

    def my_follower_mottos
        followers.each{|follower| puts follower.life_motto}
    end

    def self.least_popular
        Cult.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
        loc = {}
        Cult.all.each{|cult| !loc[cult.location] ? loc[cult.location] = 1 : loc[cult.location] += 1}
        loc.max_by{|k,v| v}[0]
    end

 
end
