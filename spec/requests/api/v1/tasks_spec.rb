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

  describe 'PATCH /api/v1/project/:id/task/:id/moveup' do
    let(:last_task_id) { project.tasks.last.id }

    context 'when logged' do
      subject { patch_with_token moveup_api_v1_project_task_path(project, last_task_id), user }

      before do
        3.times { FactoryBot.create(:task, project: project) }
      end

      it 'should move up task by 1' do
        expect{ subject }.to change{ Task.find(last_task_id).position }.by(-1)
      end

      it 'returns should be object of task' do
        subject
        expect(response).to match_response_schema('task')
      end

      it_behaves_like 'when logged', before: "subject"
    end

    it_behaves_like 'when guest', before: "patch moveup_api_v1_project_task_path(project, last_task_id)"
  end

  describe 'PATCH /api/v1/project/:id/task/:id/movedown' do
    let(:first_task_id) { project.tasks.first.id }

    context 'when logged' do
      subject { patch_with_token movedown_api_v1_project_task_path(project, first_task_id), user }

      before do
        3.times { FactoryBot.create(:task, project: project) }
      end

      it 'should move down task by 1' do
        expect{ subject }.to change{ Task.find(first_task_id).position }.by(1)
      end

      it 'returns should be object of task' do
        subject
        expect(response).to match_response_schema('task')
      end

      it_behaves_like 'when logged', before: "subject"
    end

    it_behaves_like 'when guest', before: "patch movedown_api_v1_project_task_path(project, first_task_id)"
  end
end
