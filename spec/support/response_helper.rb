module ResponseHelper
  def parse_json(response)
    response.body ? JSON.parse(response.body) : JSON.parse(response)
  end
end
