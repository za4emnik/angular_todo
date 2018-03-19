require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  let(:project) { FactoryBot.create(:project) }

  describe 'GET /api/v1/projects' do
    context 'when logged' do
      before do
        get_with_token api_v1_projects_path, project.user
      end

      it 'returns should be array of projects' do
        expect(response).to match_response_schema('projects')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_projects_path"
  end

  describe 'GET /api/v1/project/:id' do
    context 'when logged' do
      before do
        get_with_token api_v1_project_path(project), project.user
      end

      it 'returns should projects object' do
        expect(response).to match_response_schema('project')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_project_path(project)"
  end

  describe 'POST /api/v1/projects' do
    let(:project_attributes) { FactoryBot.attributes_for(:project) }
    context 'when logged' do
      before do
        post_with_token api_v1_projects_path, project.user, { project: project_attributes}
      end

      it 'returns should be object of project' do
        expect(response).to match_response_schema('project')
      end

      it 'should return created project' do
        expect(parse_json(response)).to include_json(project_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "post api_v1_projects_path"
  end

  describe 'PATCH /api/v1/project/:id' do
    context 'when logged' do
      let(:project_attributes) { FactoryBot.attributes_for(:project) }
      before do
        patch_with_token api_v1_project_path(project), project.user, { project: project_attributes}
      end

      it 'returns should be object of project' do
        expect(response).to match_response_schema('project')
      end

      it 'should return updated project' do
        expect(parse_json(response)).to include_json(project_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "patch api_v1_project_path(project)"
  end

  describe 'DELETE /api/v1/project/:id' do
    context 'when logged' do
      before do
        delete_with_token api_v1_project_path(project), project.user
      end

      it 'should return status 204' do
        expect(response).to have_http_status 204
      end

      it 'should return status 204' do
        expect(response).to have_http_status 204
      end
    end

    it_behaves_like 'when guest', before: "delete api_v1_project_path(project)"
  end
end
