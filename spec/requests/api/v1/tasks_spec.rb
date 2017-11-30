require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  let(:task) { FactoryBot.create(:task) }
  let(:project) { task.project }
  let(:user) { task.project.user }

  describe 'GET /api/v1/project/:id/tasks' do
    context 'when logged' do
      before do
        get_with_token api_v1_project_tasks_path(project), user
      end

      it 'returns should be array of tasks' do
        expect(response).to match_response_schema('tasks')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_project_tasks_path(project)"
  end

  describe 'GET /api/v1/project/:id/task/:id' do
    context 'when logged' do
      before do
        get_with_token api_v1_project_task_path(project, task), user
      end

      it 'returns should be object of task' do
        expect(response).to match_response_schema('task')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_project_task_path(project, task)"
  end

  describe 'POST /api/v1/project/:id/tasks' do
    context 'when logged' do
      let(:task_attributes) { FactoryBot.attributes_for(:task) }
      before do
        post_with_token api_v1_project_tasks_path(project), user, { task: task_attributes }
      end

      it 'returns should be object of task' do
        expect(response).to match_response_schema('task')
      end

      it 'should return created task' do
        expect(parse_json(response)).to include_json(task_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "post api_v1_project_tasks_path(project)"
  end

  describe 'PATCH /api/v1/project/:id/task/:id' do
    context 'when logged' do
      let(:task_attributes) { FactoryBot.attributes_for(:task) }
      before do
        patch_with_token api_v1_project_task_path(project, task), user, { task: task_attributes }
      end

      it 'returns should be object of task' do
        expect(response).to match_response_schema('task')
      end

      it 'should return created task' do
        expect(parse_json(response)).to include_json(task_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "patch api_v1_project_task_path(project, task)"
  end

  describe 'DELETE /api/v1/project/:id/task/:id' do
    context 'when logged' do
      before do
        delete_with_token api_v1_project_task_path(project, task), user
      end

      it 'should return status 204' do
        expect(response).to have_http_status 204
      end
    end

    it_behaves_like 'when guest', before: "delete api_v1_project_task_path(project, task)"
  end
end
