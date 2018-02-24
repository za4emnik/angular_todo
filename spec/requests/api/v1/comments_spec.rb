require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  let(:comment) { FactoryBot.create(:comment) }
  let(:task) { comment.task }
  let(:project) { comment.task.project }
  let(:user) { comment.task.project.user }

  describe 'GET /api/v1/projects/:id/tasks/:id/comments' do
    context 'when logged' do
      before do
        get_with_token api_v1_project_task_comments_path(project, task), user
      end

      it 'returns should be array of comments' do
        expect(response).to match_response_schema('comments')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_project_task_comments_path(project, task)"
  end

  describe 'GET /api/v1/projects/:id/tasks/:id/comments/:id' do
    context 'when logged' do
      before do
        get_with_token api_v1_project_task_comment_path(project, task, comment), user
      end

      it 'returns should be object of comment' do
        expect(response).to match_response_schema('comment')
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "get api_v1_project_task_comment_path(project, task, comment)"
  end

  describe 'POST /api/v1/projects/:id/tasks/:id/comments' do
    let(:comment_attributes) { FactoryBot.attributes_for(:comment) }
    context 'when logged' do
      before do
        post_with_token api_v1_project_task_comments_path(project, task), user, { comment: comment_attributes }
      end

      it 'returns should be object of comment' do
        expect(response).to match_response_schema('comment')
      end

      it 'should return created comment' do
        comment_attributes.delete(:attachment)
        expect(parse_json(response)).to include_json(comment_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "post api_v1_project_task_comments_path(project, task)"
  end

  describe 'PATCH /api/v1/projects/:id/tasks/:id/comments/:id' do
    let(:comment_attributes) { FactoryBot.attributes_for(:comment) }
    context 'when logged' do
      before do
        patch_with_token api_v1_project_task_comment_path(project, task, comment), user, { comment: comment_attributes }
      end

      it 'returns should be object of comment' do
        expect(response).to match_response_schema('comment')
      end

      it 'should return updated comment' do
        comment_attributes.delete(:attachment)
        expect(parse_json(response)).to include_json(comment_attributes)
      end

      it_behaves_like 'when logged'
    end

    it_behaves_like 'when guest', before: "patch api_v1_project_task_comment_path(project, task, comment)"
  end

  describe 'DELETE /api/v1/projects/:id/tasks/:id/comments/:id' do
    let(:comment_attributes) { FactoryBot.attributes_for(:comment) }
    context 'when logged' do
      before do
        delete_with_token api_v1_project_task_comment_path(project, task, comment), user
      end

      it 'should return status 204' do
        expect(response).to have_http_status 204
      end
    end

    it_behaves_like 'when guest', before: "delete api_v1_project_task_comment_path(project, task, comment)"
  end
end
