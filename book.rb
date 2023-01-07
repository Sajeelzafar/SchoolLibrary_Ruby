class Book
    attr_accessor :title, :author

    def initialize(title, author)
        @title = title
        @author = author
    end
end

class Rental
    attr_accessor :date

    def initialize(date)
        @date = date
    end
end
