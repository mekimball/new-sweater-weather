class Book
  attr_reader :title,
              :author,
              :isbn,
              :publisher

  def initialize(data)
    @title = data[:docs].first[:title]
    @author = data[:docs].first[:author_name].join
    @isbn = data[:docs].first[:isbn]
    @publisher = data[:docs].first[:publisher]
  end
end