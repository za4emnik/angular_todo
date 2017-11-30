RSpec.shared_examples 'when guest' do |params|
  before { eval(params[:before]) } if params&.[](:before)
  it 'returns status code should be 401' do
    expect(response).to have_http_status(401)
  end
end
