class Follower
    attr_reader :name, :age, :life_motto

    @@all = []
    def initialize (name, age, lifemotto)
        @name = name
        @age = age
        @life_motto = lifemotto
        @@all << self
    end

    def cults
        BloodOath.all.select{|oath| oath.follower == self}.map{|oath| oath.follower}
    end

    def join_cult(cult)
        age >= cult.minimum_age ? BloodOath.new(cult, self) : (p "Grow up")
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        Followers.all.select{|follower| follower.age == age}
    end

    def my_cults_slogans
        cults.map{|cult| print cult.slogan}
    end

    def self.most_active
        Followers.all.max_by{|follower| follower.cults.length}
    end

    def self.top_ten
        Followers.all.max_by(10){|follower| follower.cults.length}
    end

    def fellow_cult_members
        cults.map{|cult| cult.followers}.concat
    end

end

