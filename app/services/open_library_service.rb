class OpenLibraryService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_books(capital)
    get_url("/search.json?q=#{capital}")
  end

  private

  def conn
    Faraday.new("https://openlibrary.org")
  end
end
