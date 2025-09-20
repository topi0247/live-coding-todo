class TodosController < ApplicationController
  def index; end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def todo_params
    params.expect(todo: [:title, :body, { status: :status_id }])
  end
end
