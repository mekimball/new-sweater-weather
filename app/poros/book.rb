class Book
  attr_reader :title,
              :author,
              :isbn,
              :publisher

  def initialize(data)
    @title = data[:title]
    @author = data[:author_name].join
    @isbn = data[:isbn]
    @publisher = data[:publisher].join
  end
end