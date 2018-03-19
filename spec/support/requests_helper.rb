module RequestsHelper
  def get_with_token(path, user, params={}, headers={})
    headers = set_auth_headers(headers, user)
    get path, params: params, headers: headers
  end

  def post_with_token(path, user, params={}, headers={})
    headers = set_auth_headers(headers, user)
    post path, params: params, headers: headers
  end

  def patch_with_token(path, user, params={}, headers={})
    headers = set_auth_headers(headers, user)
    patch path, params: params, headers: headers
  end

  def delete_with_token(path, user, params={}, headers={})
    headers = set_auth_headers(headers, user)
    delete path, params: params, headers: headers
  end

  private

  def set_auth_headers(headers, user)
    headers.merge!(user.create_new_auth_token)
  end
end
