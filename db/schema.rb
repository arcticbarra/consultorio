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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181121181643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.string "reason_of_consult"
    t.date "appointment_date"
    t.integer "appointment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "checkups", force: :cascade do |t|
    t.text "family_comments"
    t.text "personal_comments"
    t.text "allergies"
    t.text "surgeries"
    t.text "results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name_father", null: false
    t.string "last_name_mother", null: false
    t.string "cedula", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "evolution_notes", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.text "diagnosis"
    t.text "treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_evolution_notes_on_doctor_id"
    t.index ["patient_id"], name: "index_evolution_notes_on_patient_id"
  end

  create_table "patient_diseases", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "disease_id"
    t.boolean "family", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_patient_diseases_on_disease_id"
    t.index ["patient_id"], name: "index_patient_diseases_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name_father", null: false
    t.string "last_name_mother", null: false
    t.integer "gender", null: false
    t.date "birth_date", null: false
    t.integer "civil_status", null: false
    t.integer "occupation", null: false
    t.string "phone", null: false
    t.string "street", null: false
    t.string "colony", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "heard_about_us"
    t.bigint "checkup_id"
    t.index ["checkup_id"], name: "index_patients_on_checkup_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "doctors", "users"
  add_foreign_key "evolution_notes", "doctors"
  add_foreign_key "evolution_notes", "patients"
  add_foreign_key "patient_diseases", "diseases"
  add_foreign_key "patient_diseases", "patients"
  add_foreign_key "patients", "checkups"
  add_foreign_key "patients", "users"
  add_foreign_key "users", "roles"
end
