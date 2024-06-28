# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_28_005057) do
  create_schema "sch_ibj"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "campaigns", force: :cascade do |t|
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_campaigns_on_deleted_at"
  end

  create_table "effort_meteorologies", force: :cascade do |t|
    t.time "time"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "visibility"
    t.float "wind_speed"
    t.string "wind_direction"
    t.integer "sea"
    t.integer "sky_cover"
    t.float "depth"
    t.float "transparency"
    t.bigint "effort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", precision: nil
    t.index ["effort_id"], name: "index_effort_meteorologies_on_effort_id"
  end

  create_table "effort_samples", force: :cascade do |t|
    t.time "sample_start"
    t.time "sample_end"
    t.float "distance"
    t.decimal "latitude_start", precision: 10, scale: 6
    t.decimal "longitude_start", precision: 10, scale: 6
    t.decimal "latitude_end", precision: 10, scale: 6
    t.decimal "longitude_end", precision: 10, scale: 6
    t.bigint "effort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", precision: nil
    t.index ["effort_id"], name: "index_effort_samples_on_effort_id"
  end

  create_table "efforts", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.date "date"
    t.string "vessel"
    t.string "coordinator"
    t.text "participant"
    t.text "route"
    t.time "total_effort_sampling"
    t.integer "first_record_id"
    t.integer "last_record_id"
    t.time "total_effort_watching"
    t.integer "amount_ids"
    t.float "distance_sampling"
    t.integer "amount_biopsy"
    t.integer "amount_species"
    t.boolean "another_species"
    t.integer "amount_puppies"
    t.integer "amount_groups"
    t.text "observation"
    t.index ["campaign_id"], name: "index_efforts_on_campaign_id"
    t.index ["deleted_at"], name: "index_efforts_on_deleted_at"
  end

  create_table "ellen", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.text "sample"
    t.bigint "post_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_ellen_on_deleted_at"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.bigint "effort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_events_on_deleted_at"
    t.index ["effort_id"], name: "index_events_on_effort_id"
  end

  create_table "itempedidos", force: :cascade do |t|
    t.decimal "valor", precision: 9, scale: 3
    t.datetime "deleted_at"
    t.bigint "produto_id", null: false
    t.bigint "pedido_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_itempedidos_on_pedido_id"
    t.index ["produto_id"], name: "index_itempedidos_on_produto_id"
  end

  create_table "locations", force: :cascade do |t|
    t.date "date"
    t.text "type"
    t.geography "latlon", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_locations_on_deleted_at"
  end

  create_table "occurrences", force: :cascade do |t|
    t.bigint "effort_id"
    t.text "gender"
    t.text "life_stage"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_occurrences_on_deleted_at"
    t.index ["effort_id"], name: "index_occurrences_on_effort_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.date "date_validade"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post", id: :bigint, default: -> { "nextval('posts_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", precision: nil
  end

  create_table "postpub", force: :cascade do |t|
    t.text "desc"
    t.bigint "post_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_postpub_on_deleted_at"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "name"
    t.decimal "valor", precision: 9, scale: 3
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.bigint "occurrence_id"
    t.text "scientific_name"
    t.text "name"
    t.integer "itis"
    t.text "worms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_species_on_deleted_at"
    t.index ["occurrence_id"], name: "index_species_on_occurrence_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "effort_meteorologies", "efforts"
  add_foreign_key "effort_samples", "efforts"
  add_foreign_key "efforts", "campaigns"
  add_foreign_key "ellen", "post", name: "sdfasdfasdf", deferrable: :deferred, validate: false
  add_foreign_key "events", "efforts"
  add_foreign_key "itempedidos", "pedidos"
  add_foreign_key "itempedidos", "produtos"
  add_foreign_key "occurrences", "efforts"
  add_foreign_key "postpub", "post", name: "fk_posts_postpub", deferrable: :deferred
  add_foreign_key "species", "occurrences"
end
