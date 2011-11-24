# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111124061740) do

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "engine"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genre",       :default => "",           :null => false
    t.string   "players",     :default => "",           :null => false
    t.string   "status",      :default => "Unreleased", :null => false
    t.text     "description", :default => "",           :null => false
  end

  create_table "task_folders", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "tasktype"
    t.integer  "difficulty"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_folder_id"
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"

end
