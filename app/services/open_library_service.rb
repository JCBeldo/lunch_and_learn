class OpenLibraryService
  def get_url('')

  end

  private

  def conn
    Faraday.new()
  end
end