user = User.find_or_create_by!(email: "user1@example.com") do |u|
  u.name = "Test User1"
  u.password = "password"
end


statuses = ["To do", "Progress", "Done"]
statuses.each do |s|
  Status.find_or_create_by!(name: s)
end

15.times do |i|
  Todo.find_or_create_by!(title: "タイトル_#{i}_タイトルタイトルタイトルタイトル") do |t|
    t.body = "タスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入るタスクの詳細文章が入る"
    t.user = user
    t.status = Status.all.sample
  end
end
