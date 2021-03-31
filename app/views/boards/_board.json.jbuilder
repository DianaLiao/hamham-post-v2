json.extract! board, :id, :name, :desc, :listed, :public, :created_at, :updated_at
json.url board_url(board, format: :json)
