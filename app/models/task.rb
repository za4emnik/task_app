class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true,
                    length: { minimum: 3 }
  validates :status, inclusion: { in: %w(new in_process done),
    message: "%{value} is not a valid status" }

    scope :statuses, -> { Task.select('status').order(status: :asc) }
    scope :count_tasks, -> { Task.joins(:project).group("projects.id").select('projects.name, COUNT(*) as cnt').order("cnt DESC")  }
    scope :count_tasks_name, -> { Task.joins(:project).group("projects.id").select('projects.name, COUNT(*) as cnt').order("projects.name ASC")  }
    scope :tasks_n, -> { Task.where("name LIKE ?",'N%')  }
    scope :projects_a, -> { Task.joins(:project).group("projects.id").select('projects.name, COUNT(tasks.id) as cnt').where("projects.name LIKE ?",'%a%')  }
    scope :tasks_dup, -> { Task.select(:name).group(:name).having("count(*) > 1").order(name: :asc)  }
    scope :tasks_garage, -> { Task.joins(:project).where("projects.name = 'GARAGE'").group("tasks.name, tasks.status").having("COUNT(*)>1").select("tasks.name, tasks.status, COUNT(*)").order("COUNT(*) ASC")  }
    scope :tasks_ten_done, -> { Task.joins(:project).where("tasks.status = 'done'").group("projects.id, projects.name").having("COUNT(*)>10").select("projects.id, projects.name, COUNT(*)").order("projects.id ASC")  }
end
