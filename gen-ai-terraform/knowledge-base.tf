resource "aws_bedrockagent_knowledge_base" "workshop_knowledge_base" {
  name     = "gen-ai-workshop-kb"
  role_arn = aws_iam_role.example.arn
  knowledge_base_configuration {
    vector_knowledge_base_configuration {
      embedding_model_arn = "arn:aws:bedrock:us-west-2::foundation-model/amazon.titan-embed-text-v2:0"
    }
    type = "VECTOR"
  }
  storage_configuration {
    type = "OPENSEARCH_SERVERLESS"
    opensearch_serverless_configuration {
      collection_arn    = "arn:aws:aoss:us-west-2:123456789012:collection/142bezjddq707i5stcrf"
      vector_index_name = "genai-vectors-collection"
      field_mapping {
        vector_field   = "vector-field"
        text_field     = "text"
        metadata_field = "metadata"
      }
    }
  }
}
