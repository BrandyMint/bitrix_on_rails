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
