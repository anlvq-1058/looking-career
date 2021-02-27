class InitTable < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :role, default: 0
      t.date :birthday
      t.timestamps
    end

    create_table :resumes do |t|
      t.string :title
      t.string :email
      t.string :avatar
      t.string :address
      t.string :facebook
      t.string :website
      t.integer :status
      t.string :phone_number
      t.timestamps
    end

    create_table :add_ons do |t|
      t.string :title
      t.date :time
      t.text :content
      t.timestamps
    end

    create_table :skills do |t|
      t.string :name
      t.timestamps
    end
    

    create_table :resume_skills do |t|
      t.integer :point
      t.timestamps
    end

    create_table :companies do |t|
      t.string :name
      t.string :website
      t.text :description
      t.date :founded
      t.timestamps
    end

    create_table :jobs do |t|
      t.string :title
      t.text :describe
      t.integer :salary
      t.string :address
      t.integer :status
      t.date :end_at
      t.integer :experience
      t.integer :gender
      t.integer :job_type
      t.timestamps
    end

    create_table :locations do |t|
      t.string :name
      t.timestamps
    end
    

    create_table :job_locations do |t|
      t.timestamps
    end
    
    
    add_reference :resumes, :user, foreign_key: true
    add_reference :add_ons, :resume, foreign_key: true
    add_reference :resume_skills, :resume, foreign_key: true
    add_reference :resume_skills, :skill, foreign_key: true
    add_index :resume_skills, [:resume_id, :skill_id], unique: true
    add_reference :companies, :user, foreign_key: true, unique: true
    add_reference :jobs, :company, foreign_key: true
    add_reference :job_locations, :job, foreign_key: true
    add_reference :job_locations, :location, foreign_key: true
    add_index :job_locations, [:job_id, :location_id], unique: true
  end

  def down
    remove_reference :resumes, :user, foreign_key: true
    remove_reference :add_ons, :resume, foreign_key: true
    remove_reference :resume_skills, :resume, foreign_key: true
    remove_reference :resume_skills, :skill, foreign_key: true
    remove_reference :companies, :user, foreign_key: true, unique: true
    remove_reference :jobs, :company, foreign_key: true
    remove_reference :job_locations, :job, foreign_key: true
    remove_reference :job_locations, :location, foreign_key: true
    
    drop_table :users
    drop_table :resumes
    drop_table :add_ons
    drop_table :skills
    drop_table :resume_skills
    drop_table :companies
    drop_table :jobs
    drop_table :locations
    drop_table :job_locations
  end
end

