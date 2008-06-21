# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080618174751) do

  create_table "articles", :force => true do |t|
    t.integer  "thread_id",                 :limit => 11
    t.integer  "parent_id",                 :limit => 11
    t.integer  "permission",                :limit => 11
    t.integer  "rank",                      :limit => 11
    t.integer  "adver",                     :limit => 11
    t.integer  "copyright",                 :limit => 11
    t.integer  "recommend",                 :limit => 11
    t.integer  "lft",                       :limit => 11
    t.integer  "rgt",                       :limit => 11
    t.integer  "attitude",                  :limit => 11, :default => 0
    t.integer  "reply_count",               :limit => 11, :default => 0
    t.integer  "view_count",                :limit => 11, :default => 1
    t.string   "title",                     :limit => 40
    t.string   "author",                    :limit => 40
    t.string   "ip_address",                :limit => 40
    t.text     "digest"
    t.text     "body"
    t.text     "body_html"
    t.text     "extended"
    t.text     "excerpt"
    t.text     "extended_html"
    t.string   "text_filter"
    t.string   "permalink"
    t.string   "article_password"
    t.string   "cached_category_id_list"
    t.string   "cached_category_name_list"
    t.boolean  "allow_reply",                             :default => true
    t.boolean  "published",                               :default => true
    t.boolean  "allow_smile",                             :default => true
    t.boolean  "show_signature",                          :default => true
    t.boolean  "allow_ping",                              :default => false
    t.boolean  "is_reply",                                :default => false
    t.boolean  "is_draft",                                :default => false
    t.boolean  "infraction",                              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  add_index "articles", ["permalink"], :name => "index_articles_on_permalink"

  create_table "articles_blogs", :id => false, :force => true do |t|
    t.integer "article_id", :limit => 11
    t.integer "blog_id",    :limit => 11
  end

  add_index "articles_blogs", ["article_id", "blog_id"], :name => "index_articles_blogs_on_article_id_and_blog_id"
  add_index "articles_blogs", ["blog_id"], :name => "index_articles_blogs_on_blog_id"

  create_table "blogs", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "subtitle",    :limit => 40
    t.integer  "status",      :limit => 11
    t.integer  "rank",        :limit => 11
    t.integer  "permission",  :limit => 11
    t.integer  "adver",       :limit => 11
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.integer  "parent_id",   :limit => 11
    t.integer  "tree_id",     :limit => 11
    t.integer  "lft",         :limit => 11
    t.integer  "rgt",         :limit => 11
    t.string   "color",       :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "commenters", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "remember_token"
    t.string   "activation_code",           :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "state",                                   :default => "passive", :null => false
    t.datetime "remember_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.datetime "activated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "article_id",     :limit => 11
    t.integer  "permission",     :limit => 11
    t.integer  "commenter_id",   :limit => 11
    t.string   "title"
    t.string   "author"
    t.string   "ip_address"
    t.string   "email"
    t.string   "website"
    t.text     "body"
    t.text     "body_html"
    t.boolean  "allow_smile",                  :default => true
    t.boolean  "show_signature",               :default => true
    t.boolean  "is_draft",                     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "globalize_countries", :force => true do |t|
    t.string "code",                   :limit => 2
    t.string "english_name"
    t.string "date_format"
    t.string "currency_format"
    t.string "currency_code",          :limit => 3
    t.string "thousands_sep",          :limit => 2
    t.string "decimal_sep",            :limit => 2
    t.string "currency_decimal_sep",   :limit => 2
    t.string "number_grouping_scheme"
  end

  add_index "globalize_countries", ["code"], :name => "index_globalize_countries_on_code"

  create_table "globalize_languages", :force => true do |t|
    t.string  "iso_639_1",             :limit => 2
    t.string  "iso_639_2",             :limit => 3
    t.string  "iso_639_3",             :limit => 3
    t.string  "rfc_3066"
    t.string  "english_name"
    t.string  "english_name_locale"
    t.string  "english_name_modifier"
    t.string  "native_name"
    t.string  "native_name_locale"
    t.string  "native_name_modifier"
    t.boolean "macro_language"
    t.string  "direction"
    t.string  "pluralization"
    t.string  "scope",                 :limit => 1
  end

  add_index "globalize_languages", ["iso_639_1"], :name => "index_globalize_languages_on_iso_639_1"
  add_index "globalize_languages", ["iso_639_2"], :name => "index_globalize_languages_on_iso_639_2"
  add_index "globalize_languages", ["iso_639_3"], :name => "index_globalize_languages_on_iso_639_3"
  add_index "globalize_languages", ["rfc_3066"], :name => "index_globalize_languages_on_rfc_3066"

  create_table "globalize_translations", :force => true do |t|
    t.string  "type"
    t.string  "tr_key"
    t.string  "table_name"
    t.integer "item_id",             :limit => 11
    t.string  "facet"
    t.boolean "built_in"
    t.integer "language_id",         :limit => 11
    t.integer "pluralization_index", :limit => 11
    t.text    "text"
    t.string  "namespace"
  end

  add_index "globalize_translations", ["tr_key", "language_id"], :name => "index_globalize_translations_on_tr_key_and_language_id"
  add_index "globalize_translations", ["table_name", "item_id", "language_id"], :name => "globalize_translations_table_name_and_item_and_language"

  create_table "memberships", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "blog_id",    :limit => 11
    t.string   "role"
    t.string   "permission"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["blog_id", "user_id"], :name => "index_memberships_on_blog_id_and_user_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued",     :limit => 11
    t.integer "lifetime",   :limit => 11
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :limit => 11,                 :null => false
    t.string  "server_url"
    t.string  "salt",                     :default => "", :null => false
  end

  create_table "open_ids", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "states"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "remember_token"
    t.string   "friends_ids"
    t.string   "name",                      :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "time_zone",                 :limit => 40, :default => "UTC"
    t.integer  "group_id",                  :limit => 11
    t.integer  "local",                     :limit => 11
    t.integer  "avatar_id",                 :limit => 11
    t.integer  "blog_id",                   :limit => 11
    t.integer  "blog_id",                   :limit => 11
    t.datetime "remember_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "activation_code",           :limit => 40
    t.string   "state",                                   :default => "passive"
  end

end
