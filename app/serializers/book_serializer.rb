class BookSerializer
  include JSONAPI::Serializer

  set_type :book
  set_id :id
  attributes  :title,
              :publisher,
              :city,
              # :books,
              :total_books_found,
              :isbn
end