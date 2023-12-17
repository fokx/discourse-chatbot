# frozen_string_literal: true

class CreateCosinePgVectorChatbotPostEmbeddingsIndex < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE INDEX pgv_hnsw_index_on_chatbot_post_embeddings ON chatbot_post_embeddings USING hnsw (embedding vector_cosine_ops)
      WITH (m = 32, ef_construction = 64);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX IF EXISTS pgv_hnsw_index_on_chatbot_post_embeddings;
    SQL
  end
end
