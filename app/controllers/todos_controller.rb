class TodosController < ApplicationController
  def index
    @todos = Status.includes(:todos).find_by(name: "To do").todos
    @progress_todos = Status.includes(:todos).find_by(name: "Progress").todos
    @done_todos = Status.includes(:todos).find_by(name: "Done").todos
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  def decrement_position
    todo = Todo.find(params[:id])
    todo.move_lower
    redirect_to root_path
  end

  private

  def todo_params
    params.expect(todo: [:title, :body, { status: :status_id }])
  end
end
