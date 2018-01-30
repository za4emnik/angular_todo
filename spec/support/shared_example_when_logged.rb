RSpec.shared_examples 'when logged' do |params|
  before { eval(params[:before]) } if params&.[](:before)

  it 'returns status code should be 200' do
    expect(response).to have_http_status(200)
  end
end
