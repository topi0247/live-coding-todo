class TodosController < ApplicationController
  def index
    todos = Todo.includes(:status).all.order(created_at: :asc)
    @todos = todos.where(status: { name: "To do" })
    @progress_todos = todos.where(status: { name: "Progress" })
    @done_todos = todos.where(status: { name: "Done" })
  end

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
