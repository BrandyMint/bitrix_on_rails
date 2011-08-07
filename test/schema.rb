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
  @@verbose = false
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

  create_table "posts" do |t|
    t.string "title"
  end

end
