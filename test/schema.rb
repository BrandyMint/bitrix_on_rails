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

ActiveRecord::Schema.define(:version => 20110725170841) do
  create_table "b_blog_post", :force => true do |t|
    t.string   "title",                                                :null => false
    t.integer  "blog_id",                                              :null => false
    t.integer  "author_id",                                            :null => false
    t.text     "preview_text"
    t.string   "preview_text_type", :limit => 4,   :default => "text", :null => false
    t.text     "detail_text",                                          :null => false
    t.string   "detail_text_type",  :limit => 4,   :default => "text", :null => false
    t.datetime "date_create",                                          :null => false
    t.datetime "date_publish",                                         :null => false
    t.string   "keywords"
    t.string   "publish_status",    :limit => 1,   :default => "P",    :null => false
    t.string   "category_id",       :limit => 100
    t.string   "atribute"
    t.string   "enable_trackback",  :limit => 1,   :default => "Y",    :null => false
    t.string   "enable_comments",   :limit => 1,   :default => "Y",    :null => false
    t.integer  "attach_img"
    t.integer  "num_comments",                     :default => 0,      :null => false
    t.integer  "num_trackbacks",                   :default => 0,      :null => false
    t.integer  "views"
    t.integer  "favorite_sort"
    t.string   "path"
    t.string   "code"
    t.integer  "uniqueness"
    t.string   "image"
  end

  create_table "b_iblock", :force => true do |t|
    t.timestamp "timestamp_x",                                          :null => false
    t.string    "iblock_type_id",    :limit => 50,                      :null => false
    t.string    "lid",               :limit => 2,                       :null => false
    t.string    "code",              :limit => 50
    t.string    "name",                                                 :null => false
    t.string    "active",            :limit => 1,   :default => "Y",    :null => false
    t.integer   "sort",                             :default => 500,    :null => false
    t.string    "list_page_url"
    t.string    "detail_page_url"
    t.string    "section_page_url"
    t.integer   "picture"
    t.text      "description"
    t.string    "description_type",  :limit => 4,   :default => "text", :null => false
    t.integer   "rss_ttl",                          :default => 24,     :null => false
    t.string    "rss_active",        :limit => 1,   :default => "Y",    :null => false
    t.string    "rss_file_active",   :limit => 1,   :default => "N",    :null => false
    t.integer   "rss_file_limit"
    t.integer   "rss_file_days"
    t.string    "rss_yandex_active", :limit => 1,   :default => "N",    :null => false
    t.string    "xml_id"
    t.string    "tmp_id",            :limit => 40
    t.string    "index_element",     :limit => 1,   :default => "Y",    :null => false
    t.string    "index_section",     :limit => 1,   :default => "N",    :null => false
    t.string    "workflow",          :limit => 1,   :default => "Y",    :null => false
    t.string    "section_chooser",   :limit => 1
    t.integer   "version",                          :default => 1,      :null => false
    t.integer   "last_conv_element",                :default => 0,      :null => false
    t.string    "edit_file_before"
    t.string    "edit_file_after"
    t.string    "sections_name",     :limit => 100
    t.string    "section_name",      :limit => 100
    t.string    "elements_name",     :limit => 100
    t.string    "element_name",      :limit => 100
    t.string    "bizproc",           :limit => 1,   :default => "N",    :null => false
    t.string    "list_mode",         :limit => 1
    t.integer   "socnet_group_id"
  end

  add_index "b_iblock", ["IBLOCK_TYPE_ID", "LID", "ACTIVE"], :name => "ix_iblock"

  create_table "b_iblock_cache", :primary_key => "cache_key", :force => true do |t|
    t.text     "cache",      :limit => 2147483647
    t.datetime "cache_date",                       :null => false
  end

  create_table "b_iblock_element", :force => true do |t|
    t.datetime "timestamp_x"
    t.integer  "modified_by"
    t.datetime "date_create"
    t.integer  "created_by"
    t.integer  "iblock_id",                                  :default => 0,      :null => false
    t.integer  "iblock_section_id"
    t.string   "active",               :limit => 1,          :default => "Y",    :null => false
    t.datetime "active_from"
    t.datetime "active_to"
    t.integer  "sort",                                       :default => 500,    :null => false
    t.string   "name",                                                           :null => false
    t.integer  "preview_picture"
    t.text     "preview_text"
    t.string   "preview_text_type",    :limit => 4,          :default => "text", :null => false
    t.integer  "detail_picture"
    t.text     "detail_text",          :limit => 2147483647
    t.string   "detail_text_type",     :limit => 4,          :default => "text", :null => false
    t.text     "searchable_content"
    t.integer  "wf_status_id",                               :default => 1
    t.integer  "wf_parent_element_id"
    t.string   "wf_new",               :limit => 1
    t.integer  "wf_locked_by"
    t.datetime "wf_date_lock"
    t.text     "wf_comments"
    t.string   "in_sections",          :limit => 1,          :default => "N",    :null => false
    t.string   "xml_id"
    t.string   "code"
    t.string   "tags"
    t.string   "tmp_id",               :limit => 40
    t.integer  "wf_last_history_id"
    t.integer  "show_counter"
    t.datetime "show_counter_start"
  end

  add_index "b_iblock_element", ["IBLOCK_ID", "IBLOCK_SECTION_ID"], :name => "ix_iblock_element_1"
  add_index "b_iblock_element", ["IBLOCK_ID", "XML_ID", "WF_PARENT_ELEMENT_ID"], :name => "ix_iblock_element_4"
  add_index "b_iblock_element", ["WF_PARENT_ELEMENT_ID"], :name => "ix_iblock_element_3"

  create_table "b_iblock_element_lock", :primary_key => "iblock_element_id", :force => true do |t|
    t.datetime "date_lock"
    t.string   "locked_by", :limit => 32
  end

  create_table "b_iblock_element_prop_m11", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m11", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m11_1"
  add_index "b_iblock_element_prop_m11", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m11_2"
  add_index "b_iblock_element_prop_m11", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m11_3"

  create_table "b_iblock_element_prop_m12", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m12", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m12_1"
  add_index "b_iblock_element_prop_m12", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m12_2"
  add_index "b_iblock_element_prop_m12", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m12_3"

  create_table "b_iblock_element_prop_m16", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m16", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m16_1"
  add_index "b_iblock_element_prop_m16", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m16_2"
  add_index "b_iblock_element_prop_m16", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m16_3"

  create_table "b_iblock_element_prop_m18", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m18", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m18_1"
  add_index "b_iblock_element_prop_m18", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m18_2"
  add_index "b_iblock_element_prop_m18", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m18_3"

  create_table "b_iblock_element_prop_m19", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m19", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m19_1"
  add_index "b_iblock_element_prop_m19", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m19_2"
  add_index "b_iblock_element_prop_m19", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m19_3"

  create_table "b_iblock_element_prop_m2", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m2", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m2_1"
  add_index "b_iblock_element_prop_m2", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m2_2"
  add_index "b_iblock_element_prop_m2", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m2_3"

  create_table "b_iblock_element_prop_m21", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m21", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m21_1"
  add_index "b_iblock_element_prop_m21", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m21_2"
  add_index "b_iblock_element_prop_m21", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m21_3"

  create_table "b_iblock_element_prop_m22", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m22", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m22_1"
  add_index "b_iblock_element_prop_m22", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m22_2"
  add_index "b_iblock_element_prop_m22", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m22_3"

  create_table "b_iblock_element_prop_m24", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m24", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m24_1"
  add_index "b_iblock_element_prop_m24", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m24_2"
  add_index "b_iblock_element_prop_m24", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m24_3"

  create_table "b_iblock_element_prop_m3", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m3", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m3_1"
  add_index "b_iblock_element_prop_m3", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m3_2"
  add_index "b_iblock_element_prop_m3", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m3_3"

  create_table "b_iblock_element_prop_m30", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m30", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m30_1"
  add_index "b_iblock_element_prop_m30", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m30_2"
  add_index "b_iblock_element_prop_m30", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m30_3"

  create_table "b_iblock_element_prop_m32", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m32", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m32_1"
  add_index "b_iblock_element_prop_m32", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m32_2"
  add_index "b_iblock_element_prop_m32", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m32_3"

  create_table "b_iblock_element_prop_m34", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m34", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m34_1"
  add_index "b_iblock_element_prop_m34", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m34_2"
  add_index "b_iblock_element_prop_m34", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m34_3"

  create_table "b_iblock_element_prop_m35", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m35", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m35_1"
  add_index "b_iblock_element_prop_m35", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m35_2"
  add_index "b_iblock_element_prop_m35", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m35_3"

  create_table "b_iblock_element_prop_m37", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m37", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m37_1"
  add_index "b_iblock_element_prop_m37", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m37_2"
  add_index "b_iblock_element_prop_m37", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m37_3"

  create_table "b_iblock_element_prop_m38", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m38", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m38_1"
  add_index "b_iblock_element_prop_m38", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m38_2"
  add_index "b_iblock_element_prop_m38", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m38_3"

  create_table "b_iblock_element_prop_m39", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m39", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m39_1"
  add_index "b_iblock_element_prop_m39", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m39_2"
  add_index "b_iblock_element_prop_m39", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m39_3"

  create_table "b_iblock_element_prop_m4", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m4", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m4_1"
  add_index "b_iblock_element_prop_m4", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m4_2"
  add_index "b_iblock_element_prop_m4", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m4_3"

  create_table "b_iblock_element_prop_m40", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m40", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m40_1"
  add_index "b_iblock_element_prop_m40", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m40_2"
  add_index "b_iblock_element_prop_m40", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m40_3"

  create_table "b_iblock_element_prop_m41", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m41", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m41_1"
  add_index "b_iblock_element_prop_m41", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m41_2"
  add_index "b_iblock_element_prop_m41", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m41_3"

  create_table "b_iblock_element_prop_m44", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m44", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m44_1"
  add_index "b_iblock_element_prop_m44", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m44_2"
  add_index "b_iblock_element_prop_m44", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m44_3"

  create_table "b_iblock_element_prop_m47", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m47", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m47_1"
  add_index "b_iblock_element_prop_m47", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m47_2"
  add_index "b_iblock_element_prop_m47", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m47_3"

  create_table "b_iblock_element_prop_m48", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m48", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m48_1"
  add_index "b_iblock_element_prop_m48", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m48_2"
  add_index "b_iblock_element_prop_m48", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m48_3"

  create_table "b_iblock_element_prop_m49", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m49", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m49_1"
  add_index "b_iblock_element_prop_m49", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m49_2"
  add_index "b_iblock_element_prop_m49", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m49_3"

  create_table "b_iblock_element_prop_m5", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m5", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m5_1"
  add_index "b_iblock_element_prop_m5", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m5_2"
  add_index "b_iblock_element_prop_m5", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m5_3"

  create_table "b_iblock_element_prop_m50", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m50", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m50_1"
  add_index "b_iblock_element_prop_m50", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m50_2"
  add_index "b_iblock_element_prop_m50", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m50_3"

  create_table "b_iblock_element_prop_m51", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m51", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m51_1"
  add_index "b_iblock_element_prop_m51", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m51_2"
  add_index "b_iblock_element_prop_m51", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m51_3"

  create_table "b_iblock_element_prop_m52", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m52", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m52_1"
  add_index "b_iblock_element_prop_m52", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m52_2"
  add_index "b_iblock_element_prop_m52", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m52_3"

  create_table "b_iblock_element_prop_m55", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m55", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m55_1"
  add_index "b_iblock_element_prop_m55", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m55_2"
  add_index "b_iblock_element_prop_m55", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m55_3"

  create_table "b_iblock_element_prop_m56", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m56", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m56_1"
  add_index "b_iblock_element_prop_m56", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m56_2"
  add_index "b_iblock_element_prop_m56", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m56_3"

  create_table "b_iblock_element_prop_m57", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m57", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m57_1"
  add_index "b_iblock_element_prop_m57", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m57_2"
  add_index "b_iblock_element_prop_m57", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m57_3"

  create_table "b_iblock_element_prop_m58", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m58", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m58_1"
  add_index "b_iblock_element_prop_m58", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m58_2"
  add_index "b_iblock_element_prop_m58", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m58_3"

  create_table "b_iblock_element_prop_m59", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m59", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m59_1"
  add_index "b_iblock_element_prop_m59", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m59_2"
  add_index "b_iblock_element_prop_m59", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m59_3"

  create_table "b_iblock_element_prop_m6", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m6", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m6_1"
  add_index "b_iblock_element_prop_m6", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m6_2"
  add_index "b_iblock_element_prop_m6", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m6_3"

  create_table "b_iblock_element_prop_m7", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m7", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m7_1"
  add_index "b_iblock_element_prop_m7", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m7_2"
  add_index "b_iblock_element_prop_m7", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m7_3"

  create_table "b_iblock_element_prop_m8", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m8", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m8_1"
  add_index "b_iblock_element_prop_m8", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m8_2"
  add_index "b_iblock_element_prop_m8", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m8_3"

  create_table "b_iblock_element_prop_m9", :force => true do |t|
    t.integer "iblock_element_id",                                 :null => false
    t.integer "iblock_property_id",                                :null => false
    t.text    "value",                                             :null => false
    t.integer "value_enum"
    t.decimal "value_num",          :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_prop_m9", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m9_1"
  add_index "b_iblock_element_prop_m9", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m9_2"
  add_index "b_iblock_element_prop_m9", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_elem_prop_m9_3"

  create_table "b_iblock_element_prop_s11", :primary_key => "iblock_element_id", :force => true do |t|
  end

  create_table "b_iblock_element_prop_s12", :primary_key => "iblock_element_id", :force => true do |t|
  end

  create_table "b_iblock_element_prop_s16", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_69"
    t.string  "description_69"
    t.text    "property_70"
    t.string  "description_70"
    t.decimal "property_71",     :precision => 18, :scale => 4
    t.string  "description_71"
    t.integer "property_226"
    t.string  "description_226"
    t.text    "property_325"
    t.string  "description_325"
    t.decimal "property_398",    :precision => 18, :scale => 4
    t.string  "description_398"
    t.text    "property_432"
    t.string  "description_432"
    t.text    "property_433"
    t.string  "description_433"
    t.text    "property_435"
    t.string  "description_435"
  end

  create_table "b_iblock_element_prop_s18", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_82"
    t.string  "description_82"
    t.text    "property_83"
    t.string  "description_83"
    t.integer "property_84"
    t.string  "description_84"
    t.integer "property_85"
    t.string  "description_85"
    t.decimal "property_284",    :precision => 18, :scale => 4
    t.string  "description_284"
    t.integer "property_285"
    t.string  "description_285"
  end

  create_table "b_iblock_element_prop_s19", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_89",     :precision => 18, :scale => 4
    t.string  "description_89"
    t.decimal "property_168",    :precision => 18, :scale => 4
    t.string  "description_168"
  end

  create_table "b_iblock_element_prop_s2", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_7"
    t.string  "description_7"
    t.decimal "property_8",    :precision => 18, :scale => 4
    t.string  "description_8"
  end

  create_table "b_iblock_element_prop_s21", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_97"
    t.string  "description_97"
    t.decimal "property_98",     :precision => 18, :scale => 4
    t.string  "description_98"
    t.decimal "property_146",    :precision => 18, :scale => 4
    t.string  "description_146"
    t.text    "property_434"
    t.string  "description_434"
  end

  create_table "b_iblock_element_prop_s22", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_117"
    t.string  "description_117"
    t.integer "property_118"
    t.string  "description_118"
    t.text    "property_119"
    t.string  "description_119"
    t.integer "property_369"
    t.string  "description_369"
    t.integer "property_370"
    t.string  "description_370"
    t.integer "property_371"
    t.string  "description_371"
    t.integer "property_372"
    t.string  "description_372"
  end

  create_table "b_iblock_element_prop_s24", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_328",    :precision => 18, :scale => 4
    t.string  "description_328"
  end

  create_table "b_iblock_element_prop_s3", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_9",      :precision => 18, :scale => 4
    t.string  "description_9"
    t.text    "property_11"
    t.string  "description_11"
    t.decimal "property_13",     :precision => 18, :scale => 4
    t.string  "description_13"
    t.integer "property_15"
    t.string  "description_15"
    t.integer "property_16"
    t.string  "description_16"
    t.integer "property_17"
    t.string  "description_17"
    t.integer "property_18"
    t.string  "description_18"
    t.text    "property_20"
    t.string  "description_20"
    t.integer "property_21"
    t.string  "description_21"
    t.integer "property_37"
    t.string  "description_37"
    t.integer "property_38"
    t.string  "description_38"
    t.text    "property_123"
    t.string  "description_123"
    t.integer "property_124"
    t.string  "description_124"
    t.decimal "property_152",    :precision => 18, :scale => 4
    t.string  "description_152"
    t.integer "property_193"
    t.string  "description_193"
    t.integer "property_280"
    t.string  "description_280"
    t.integer "property_290"
    t.string  "description_290"
    t.decimal "property_309",    :precision => 18, :scale => 4
    t.string  "description_309"
    t.decimal "property_327",    :precision => 18, :scale => 4
    t.string  "description_327"
    t.text    "property_341"
    t.string  "description_341"
    t.text    "property_342"
    t.string  "description_342"
    t.decimal "property_349",    :precision => 18, :scale => 4
    t.string  "description_349"
    t.decimal "property_410",    :precision => 18, :scale => 4
    t.string  "description_410"
    t.text    "property_421"
    t.string  "description_421"
    t.text    "property_422"
    t.string  "description_422"
    t.integer "property_430"
    t.string  "description_430"
    t.text    "property_438"
    t.string  "description_438"
  end

  create_table "b_iblock_element_prop_s30", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_200"
    t.string  "description_200"
    t.integer "property_201"
    t.string  "description_201"
    t.decimal "property_202",    :precision => 18, :scale => 4
    t.string  "description_202"
    t.decimal "property_204",    :precision => 18, :scale => 4
    t.string  "description_204"
    t.integer "property_223"
    t.string  "description_223"
    t.integer "property_360"
    t.string  "description_360"
    t.decimal "property_361",    :precision => 18, :scale => 4
    t.string  "description_361"
    t.integer "property_393"
    t.string  "description_393"
  end

  create_table "b_iblock_element_prop_s32", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_227",    :precision => 18, :scale => 4
    t.string  "description_227"
    t.text    "property_228"
    t.string  "description_228"
    t.text    "property_316"
    t.string  "description_316"
    t.integer "property_320"
    t.string  "description_320"
  end

  create_table "b_iblock_element_prop_s34", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_254",    :precision => 18, :scale => 4
    t.string  "description_254"
    t.integer "property_255"
    t.string  "description_255"
    t.integer "property_256"
    t.string  "description_256"
    t.text    "property_257"
    t.string  "description_257"
    t.text    "property_258"
    t.string  "description_258"
    t.integer "property_283"
    t.string  "description_283"
    t.text    "property_292"
    t.string  "description_292"
    t.integer "property_293"
    t.string  "description_293"
  end

  create_table "b_iblock_element_prop_s35", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_234"
    t.string  "description_234"
    t.decimal "property_237",    :precision => 18, :scale => 4
    t.string  "description_237"
    t.decimal "property_244",    :precision => 18, :scale => 4
    t.string  "description_244"
    t.decimal "property_261",    :precision => 18, :scale => 4
    t.string  "description_261"
    t.integer "property_298"
    t.string  "description_298"
  end

  create_table "b_iblock_element_prop_s37", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_245"
    t.string  "description_245"
    t.text    "property_246"
    t.string  "description_246"
    t.decimal "property_247",    :precision => 18, :scale => 4
    t.string  "description_247"
    t.integer "property_248"
    t.string  "description_248"
    t.integer "property_253"
    t.string  "description_253"
    t.integer "property_259"
    t.string  "description_259"
    t.integer "property_260"
    t.string  "description_260"
    t.integer "property_264"
    t.string  "description_264"
    t.integer "property_265"
    t.string  "description_265"
    t.integer "property_266"
    t.string  "description_266"
    t.integer "property_335"
    t.string  "description_335"
  end

  create_table "b_iblock_element_prop_s38", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_262"
    t.string  "description_262"
    t.integer "property_263"
    t.string  "description_263"
  end

  create_table "b_iblock_element_prop_s39", :primary_key => "iblock_element_id", :force => true do |t|
    t.text   "property_267"
    t.string "description_267"
    t.text   "property_268"
    t.string "description_268"
  end

  create_table "b_iblock_element_prop_s4", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_6"
    t.string  "description_6"
    t.integer "property_42"
    t.string  "description_42"
    t.text    "property_43"
    t.string  "description_43"
    t.decimal "property_44",     :precision => 18, :scale => 4
    t.string  "description_44"
    t.decimal "property_49",     :precision => 18, :scale => 4
    t.string  "description_49"
    t.decimal "property_50",     :precision => 18, :scale => 4
    t.string  "description_50"
    t.integer "property_51"
    t.string  "description_51"
    t.text    "property_52"
    t.string  "description_52"
    t.text    "property_54"
    t.string  "description_54"
    t.text    "property_55"
    t.string  "description_55"
    t.text    "property_57"
    t.string  "description_57"
    t.integer "property_58"
    t.string  "description_58"
    t.integer "property_59"
    t.string  "description_59"
    t.decimal "property_60",     :precision => 18, :scale => 4
    t.string  "description_60"
    t.integer "property_61"
    t.string  "description_61"
    t.integer "property_62"
    t.string  "description_62"
    t.integer "property_63"
    t.string  "description_63"
    t.text    "property_64"
    t.string  "description_64"
    t.text    "property_65"
    t.string  "description_65"
    t.integer "property_66"
    t.string  "description_66"
    t.integer "property_67"
    t.string  "description_67"
    t.text    "property_68"
    t.string  "description_68"
    t.text    "property_74"
    t.string  "description_74"
    t.text    "property_77"
    t.string  "description_77"
    t.text    "property_80"
    t.string  "description_80"
    t.decimal "property_86",     :precision => 18, :scale => 4
    t.string  "description_86"
    t.decimal "property_87",     :precision => 18, :scale => 4
    t.string  "description_87"
    t.decimal "property_88",     :precision => 18, :scale => 4
    t.string  "description_88"
    t.text    "property_90"
    t.string  "description_90"
    t.text    "property_91"
    t.string  "description_91"
    t.decimal "property_92",     :precision => 18, :scale => 4
    t.string  "description_92"
    t.decimal "property_207",    :precision => 18, :scale => 4
    t.string  "description_207"
    t.decimal "property_221",    :precision => 18, :scale => 4
    t.string  "description_221"
    t.integer "property_233"
    t.string  "description_233"
    t.text    "property_270"
    t.string  "description_270"
    t.text    "property_271"
    t.string  "description_271"
    t.text    "property_272"
    t.string  "description_272"
    t.text    "property_275"
    t.string  "description_275"
    t.text    "property_276"
    t.string  "description_276"
    t.text    "property_277"
    t.string  "description_277"
    t.integer "property_295"
    t.string  "description_295"
    t.decimal "property_310",    :precision => 18, :scale => 4
    t.string  "description_310"
    t.decimal "property_311",    :precision => 18, :scale => 4
    t.string  "description_311"
    t.text    "property_312"
    t.string  "description_312"
    t.decimal "property_313",    :precision => 18, :scale => 4
    t.string  "description_313"
    t.decimal "property_314",    :precision => 18, :scale => 4
    t.string  "description_314"
    t.decimal "property_315",    :precision => 18, :scale => 4
    t.string  "description_315"
    t.decimal "property_317",    :precision => 18, :scale => 4
    t.string  "description_317"
    t.decimal "property_322",    :precision => 18, :scale => 4
    t.string  "description_322"
    t.text    "property_323"
    t.string  "description_323"
    t.decimal "property_329",    :precision => 18, :scale => 4
    t.string  "description_329"
    t.decimal "property_330",    :precision => 18, :scale => 4
    t.string  "description_330"
    t.decimal "property_331",    :precision => 18, :scale => 4
    t.string  "description_331"
    t.decimal "property_332",    :precision => 18, :scale => 4
    t.string  "description_332"
    t.decimal "property_333",    :precision => 18, :scale => 4
    t.string  "description_333"
    t.decimal "property_343",    :precision => 18, :scale => 4
    t.string  "description_343"
    t.decimal "property_344",    :precision => 18, :scale => 4
    t.string  "description_344"
    t.decimal "property_366",    :precision => 18, :scale => 4
    t.string  "description_366"
    t.text    "property_367"
    t.string  "description_367"
    t.text    "property_368"
    t.string  "description_368"
    t.decimal "property_390",    :precision => 18, :scale => 4
    t.string  "description_390"
    t.decimal "property_391",    :precision => 18, :scale => 4
    t.string  "description_391"
    t.decimal "property_392",    :precision => 18, :scale => 4
    t.string  "description_392"
    t.text    "property_399"
    t.string  "description_399"
    t.decimal "property_411",    :precision => 18, :scale => 4
    t.string  "description_411"
    t.text    "property_423"
    t.string  "description_423"
    t.integer "property_431"
    t.string  "description_431"
  end

  create_table "b_iblock_element_prop_s40", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_273"
    t.string  "description_273"
    t.integer "property_274"
    t.string  "description_274"
  end

  create_table "b_iblock_element_prop_s41", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_281"
    t.string  "description_281"
    t.text    "property_282"
    t.string  "description_282"
  end

  create_table "b_iblock_element_prop_s44", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_299"
    t.string  "description_299"
    t.text    "property_300"
    t.string  "description_300"
    t.text    "property_301"
    t.string  "description_301"
    t.integer "property_302"
    t.string  "description_302"
  end

  create_table "b_iblock_element_prop_s47", :primary_key => "iblock_element_id", :force => true do |t|
  end

  create_table "b_iblock_element_prop_s48", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_348",    :precision => 18, :scale => 4
    t.string  "description_348"
  end

  create_table "b_iblock_element_prop_s49", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_334"
    t.string  "description_334"
  end

  create_table "b_iblock_element_prop_s5", :primary_key => "iblock_element_id", :force => true do |t|
  end

  create_table "b_iblock_element_prop_s50", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_351",    :precision => 18, :scale => 4
    t.string  "description_351"
    t.decimal "property_352",    :precision => 18, :scale => 4
    t.string  "description_352"
  end

  create_table "b_iblock_element_prop_s51", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_353",    :precision => 18, :scale => 4
    t.string  "description_353"
    t.decimal "property_354",    :precision => 18, :scale => 4
    t.string  "description_354"
    t.text    "property_355"
    t.string  "description_355"
  end

  create_table "b_iblock_element_prop_s52", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_362"
    t.string  "description_362"
    t.decimal "property_363",    :precision => 18, :scale => 4
    t.string  "description_363"
    t.decimal "property_364",    :precision => 18, :scale => 4
    t.string  "description_364"
    t.integer "property_365"
    t.string  "description_365"
    t.integer "property_397"
    t.string  "description_397"
    t.decimal "property_407",    :precision => 18, :scale => 4
    t.string  "description_407"
    t.decimal "property_408",    :precision => 18, :scale => 4
    t.string  "description_408"
  end

  create_table "b_iblock_element_prop_s55", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_386",    :precision => 18, :scale => 4
    t.string  "description_386"
    t.decimal "property_387",    :precision => 18, :scale => 4
    t.string  "description_387"
    t.text    "property_388"
    t.string  "description_388"
    t.text    "property_389"
    t.string  "description_389"
  end

  create_table "b_iblock_element_prop_s56", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_394",    :precision => 18, :scale => 4
    t.string  "description_394"
    t.decimal "property_395",    :precision => 18, :scale => 4
    t.string  "description_395"
    t.decimal "property_396",    :precision => 18, :scale => 4
    t.string  "description_396"
  end

  create_table "b_iblock_element_prop_s57", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_400"
    t.string  "description_400"
    t.text    "property_401"
    t.string  "description_401"
    t.decimal "property_402",    :precision => 18, :scale => 4
    t.string  "description_402"
    t.decimal "property_403",    :precision => 18, :scale => 4
    t.string  "description_403"
    t.decimal "property_404",    :precision => 18, :scale => 4
    t.string  "description_404"
    t.decimal "property_405",    :precision => 18, :scale => 4
    t.string  "description_405"
    t.decimal "property_406",    :precision => 18, :scale => 4
    t.string  "description_406"
    t.decimal "property_409",    :precision => 18, :scale => 4
    t.string  "description_409"
  end

  create_table "b_iblock_element_prop_s58", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_437"
    t.string  "description_437"
  end

  create_table "b_iblock_element_prop_s59", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_425"
    t.string  "description_425"
    t.integer "property_426"
    t.string  "description_426"
    t.text    "property_428"
    t.string  "description_428"
    t.text    "property_429"
    t.string  "description_429"
  end

  create_table "b_iblock_element_prop_s6", :primary_key => "iblock_element_id", :force => true do |t|
    t.decimal "property_10",    :precision => 18, :scale => 4
    t.string  "description_10"
  end

  create_table "b_iblock_element_prop_s7", :primary_key => "iblock_element_id", :force => true do |t|
    t.integer "property_120"
    t.string  "description_120"
    t.text    "property_182"
    t.string  "description_182"
    t.text    "property_183"
    t.string  "description_183"
    t.text    "property_184"
    t.string  "description_184"
    t.text    "property_185"
    t.string  "description_185"
    t.text    "property_186"
    t.string  "description_186"
    t.text    "property_187"
    t.string  "description_187"
    t.text    "property_188"
    t.string  "description_188"
    t.text    "property_189"
    t.string  "description_189"
    t.text    "property_190"
    t.string  "description_190"
    t.text    "property_191"
    t.string  "description_191"
    t.text    "property_192"
    t.string  "description_192"
    t.text    "property_287"
    t.string  "description_287"
    t.text    "property_288"
    t.string  "description_288"
    t.text    "property_289"
    t.string  "description_289"
    t.decimal "property_291",    :precision => 18, :scale => 4
    t.string  "description_291"
    t.decimal "property_350",    :precision => 18, :scale => 4
    t.string  "description_350"
    t.text    "property_356"
    t.string  "description_356"
    t.text    "property_357"
    t.string  "description_357"
    t.text    "property_358"
    t.string  "description_358"
    t.text    "property_359"
    t.string  "description_359"
    t.decimal "property_373",    :precision => 18, :scale => 4
    t.string  "description_373"
    t.decimal "property_374",    :precision => 18, :scale => 4
    t.string  "description_374"
    t.decimal "property_375",    :precision => 18, :scale => 4
    t.string  "description_375"
    t.text    "property_376"
    t.string  "description_376"
    t.text    "property_412"
    t.string  "description_412"
    t.text    "property_413"
    t.string  "description_413"
    t.text    "property_414"
    t.string  "description_414"
    t.text    "property_415"
    t.string  "description_415"
    t.text    "property_416"
    t.string  "description_416"
    t.text    "property_417"
    t.string  "description_417"
    t.text    "property_418"
    t.string  "description_418"
    t.text    "property_419"
    t.string  "description_419"
    t.text    "property_420"
    t.string  "description_420"
    t.text    "property_439"
    t.string  "description_439"
    t.text    "property_440"
    t.string  "description_440"
    t.text    "property_441"
    t.string  "description_441"
    t.text    "property_442"
    t.string  "description_442"
    t.text    "property_443"
    t.string  "description_443"
    t.text    "property_444"
    t.string  "description_444"
  end

  create_table "b_iblock_element_prop_s8", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_22"
    t.string  "description_22"
    t.decimal "property_23",    :precision => 18, :scale => 4
    t.string  "description_23"
    t.decimal "property_24",    :precision => 18, :scale => 4
    t.string  "description_24"
    t.decimal "property_25",    :precision => 18, :scale => 4
    t.string  "description_25"
    t.decimal "property_32",    :precision => 18, :scale => 4
    t.string  "description_32"
  end

  create_table "b_iblock_element_prop_s9", :primary_key => "iblock_element_id", :force => true do |t|
    t.text    "property_29"
    t.string  "description_29"
    t.decimal "property_30",    :precision => 18, :scale => 4
    t.string  "description_30"
    t.integer "property_31"
    t.string  "description_31"
    t.decimal "property_33",    :precision => 18, :scale => 4
    t.string  "description_33"
  end

  create_table "b_iblock_element_property", :force => true do |t|
    t.integer "iblock_property_id",                                                                 :null => false
    t.integer "iblock_element_id",                                                                  :null => false
    t.text    "value",                                                                              :null => false
    t.string  "value_type",         :limit => 4,                                :default => "text", :null => false
    t.integer "value_enum"
    t.decimal "value_num",                       :precision => 18, :scale => 4
    t.string  "description"
  end

  add_index "b_iblock_element_property", ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_element_property_1"
  add_index "b_iblock_element_property", ["IBLOCK_PROPERTY_ID"], :name => "ix_iblock_element_property_2"
  add_index "b_iblock_element_property", ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], :name => "ix_iblock_element_prop_enum"

  create_table "b_iblock_elements_wf", :force => true do |t|
    t.string   "name",                                       :null => false
    t.datetime "active_from",                                :null => false
    t.integer  "created_by"
    t.datetime "date_create",                                :null => false
    t.text     "detail_text",          :limit => 2147483647
    t.text     "preview_text"
    t.string   "tags"
    t.datetime "timestamp_x"
    t.integer  "show_counter"
    t.integer  "id_blog"
    t.integer  "file"
    t.integer  "status"
    t.integer  "post_id"
    t.text     "glob_class"
    t.text     "user_class"
    t.boolean  "post_analitik"
    t.boolean  "auto_rubric"
    t.boolean  "link_change"
    t.text     "comment"
    t.text     "comment_bloger"
    t.integer  "user_id",                                    :null => false
    t.integer  "user_id_check"
    t.boolean  "old"
    t.integer  "change_cnt",                                 :null => false
    t.integer  "theme"
    t.string   "name2"
    t.text     "preview_mpage",        :limit => 2147483647
    t.integer  "detail_picture"
    t.string   "is_main_anons",        :limit => 1
    t.integer  "preview_picture_mp"
    t.string   "mainp_preview_title"
    t.text     "mainp_preview_text_1", :limit => 2147483647
    t.text     "mainp_preview_text_2", :limit => 2147483647
    t.integer  "use_article_title"
    t.integer  "use_article_text1"
    t.integer  "use_article_text2"
    t.integer  "use_article_text3"
  end

  add_index "b_iblock_elements_wf", ["ACTIVE_FROM"], :name => "ACTIVE_FROM"
  add_index "b_iblock_elements_wf", ["ID_BLOG"], :name => "ID_BLOG"
  add_index "b_iblock_elements_wf", ["OLD"], :name => "OLD"
  add_index "b_iblock_elements_wf", ["POST_ID"], :name => "POST_ID"
  add_index "b_iblock_elements_wf", ["USER_ID"], :name => "USER_ID"

  create_table "b_iblock_fields", :id => false, :force => true do |t|
    t.integer "iblock_id",                           :null => false
    t.string  "field_id",      :limit => 50,         :null => false
    t.string  "is_required",   :limit => 1
    t.text    "default_value", :limit => 2147483647
  end

  create_table "b_iblock_group", :id => false, :force => true do |t|
    t.integer "iblock_id",               :null => false
    t.integer "group_id",                :null => false
    t.string  "permission", :limit => 1, :null => false
  end

  add_index "b_iblock_group", ["IBLOCK_ID", "GROUP_ID"], :name => "ux_iblock_group_1", :unique => true

  create_table "b_iblock_messages", :id => false, :force => true do |t|
    t.integer "iblock_id",                  :null => false
    t.string  "message_id",   :limit => 50, :null => false
    t.string  "message_text"
  end

  create_table "b_iblock_property", :force => true do |t|
    t.timestamp "timestamp_x",                                        :null => false
    t.integer   "iblock_id",                                          :null => false
    t.string    "name",               :limit => 100,                  :null => false
    t.string    "active",             :limit => 1,   :default => "Y", :null => false
    t.integer   "sort",                              :default => 500, :null => false
    t.string    "code",               :limit => 50
    t.text      "default_value"
    t.string    "property_type",      :limit => 1,   :default => "S", :null => false
    t.integer   "row_count",                         :default => 1,   :null => false
    t.integer   "col_count",                         :default => 30,  :null => false
    t.string    "list_type",          :limit => 1,   :default => "L", :null => false
    t.string    "multiple",           :limit => 1,   :default => "N", :null => false
    t.string    "xml_id",             :limit => 100
    t.string    "file_type",          :limit => 200
    t.integer   "multiple_cnt"
    t.string    "tmp_id",             :limit => 40
    t.integer   "link_iblock_id"
    t.string    "with_description",   :limit => 1
    t.string    "searchable",         :limit => 1,   :default => "N", :null => false
    t.string    "filtrable",          :limit => 1,   :default => "N", :null => false
    t.string    "is_required",        :limit => 1
    t.integer   "version",                           :default => 1,   :null => false
    t.string    "user_type"
    t.text      "user_type_settings"
  end

  add_index "b_iblock_property", ["CODE"], :name => "ix_iblock_property_2"
  add_index "b_iblock_property", ["IBLOCK_ID"], :name => "ix_iblock_property_1"

  create_table "b_iblock_property_enum", :force => true do |t|
    t.integer "property_id",                                 :null => false
    t.string  "value",                                       :null => false
    t.string  "def",         :limit => 1,   :default => "N", :null => false
    t.integer "sort",                       :default => 500, :null => false
    t.string  "xml_id",      :limit => 200,                  :null => false
    t.string  "tmp_id",      :limit => 40
  end

  add_index "b_iblock_property_enum", ["PROPERTY_ID", "XML_ID"], :name => "ux_iblock_property_enum", :unique => true

  create_table "b_iblock_rss", :force => true do |t|
    t.integer "iblock_id",                 :null => false
    t.string  "node",       :limit => 50,  :null => false
    t.string  "node_value", :limit => 250
  end

  create_table "b_iblock_section", :force => true do |t|
    t.timestamp "timestamp_x",                                          :null => false
    t.integer   "modified_by"
    t.datetime  "date_create"
    t.integer   "created_by"
    t.integer   "iblock_id",                                            :null => false
    t.integer   "iblock_section_id"
    t.string    "active",             :limit => 1,  :default => "Y",    :null => false
    t.string    "global_active",      :limit => 1,  :default => "Y",    :null => false
    t.integer   "sort",                             :default => 500,    :null => false
    t.string    "name",                                                 :null => false
    t.integer   "picture"
    t.integer   "left_margin"
    t.integer   "right_margin"
    t.integer   "depth_level"
    t.text      "description"
    t.string    "description_type",   :limit => 4,  :default => "text", :null => false
    t.text      "searchable_content"
    t.string    "code"
    t.string    "xml_id"
    t.string    "tmp_id",             :limit => 40
    t.integer   "detail_picture"
    t.integer   "socnet_group_id"
  end

  add_index "b_iblock_section", ["IBLOCK_ID", "DEPTH_LEVEL"], :name => "ix_iblock_section_depth_level"
  add_index "b_iblock_section", ["IBLOCK_ID", "IBLOCK_SECTION_ID"], :name => "ix_iblock_section_1"
  add_index "b_iblock_section", ["IBLOCK_ID", "LEFT_MARGIN", "RIGHT_MARGIN"], :name => "ix_iblock_section_left_margin"
  add_index "b_iblock_section", ["IBLOCK_ID", "RIGHT_MARGIN", "LEFT_MARGIN"], :name => "ix_iblock_section_right_margin"

  create_table "b_iblock_section_element", :id => false, :force => true do |t|
    t.integer "iblock_section_id",      :null => false
    t.integer "iblock_element_id",      :null => false
    t.integer "additional_property_id"
  end

  add_index "b_iblock_section_element", ["IBLOCK_ELEMENT_ID"], :name => "UX_IBLOCK_SECTION_ELEMENT2"
  add_index "b_iblock_section_element", ["IBLOCK_SECTION_ID", "IBLOCK_ELEMENT_ID", "ADDITIONAL_PROPERTY_ID"], :name => "ux_iblock_section_element", :unique => true

  create_table "b_iblock_sequence", :id => false, :force => true do |t|
    t.integer "iblock_id",               :null => false
    t.string  "code",      :limit => 50, :null => false
    t.integer "seq_value"
  end

  create_table "b_iblock_site", :id => false, :force => true do |t|
    t.integer "iblock_id",              :null => false
    t.string  "site_id",   :limit => 2, :null => false
  end

  create_table "b_iblock_type", :force => true do |t|
    t.string  "sections",         :limit => 1, :default => "Y", :null => false
    t.string  "edit_file_before"
    t.string  "edit_file_after"
    t.string  "in_rss",           :limit => 1, :default => "N", :null => false
    t.integer "sort",                          :default => 500, :null => false
  end

  create_table "b_iblock_type_lang", :id => false, :force => true do |t|
    t.string "iblock_type_id", :limit => 50,  :null => false
    t.string "lid",            :limit => 2,   :null => false
    t.string "name",           :limit => 100, :null => false
    t.string "section_name",   :limit => 100
    t.string "element_name",   :limit => 100, :null => false
  end

end
