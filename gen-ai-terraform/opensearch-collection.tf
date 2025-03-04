resource "aws_opensearchserverless_collection" "vector-collection" {
  name = "genai-vectors-collection"

  depends_on = [aws_opensearchserverless_security_policy.example]
}

resource "aws_opensearchserverless_security_policy" "workshop-collection-security_policy" {
  name = "${local.prefix}-${local.project}-encryption-policy"
  type = "encryption"
  policy = jsonencode({
    "Rules" = [
      {
        "Resource" = [
          "collection/genai-vectors-collection"
        ],
        "ResourceType" = "collection"
      }
    ],
    "AWSOwnedKey" = true
  })
}

resource "aws_opensearchserverless_security_policy" "workshop-collection-network-policy" {
  name        = "${local.prefix}-${local.project}-network-policy"
  type        = "network"
  description = "Public access"
  policy = jsonencode([
    {
      Description = "Public access to collection and Dashboards endpoint for example collection",
      Rules = [
        {
          ResourceType = "collection",
          Resource = [
            "collection/genai-vectors-collection"
          ]
        }
      ],
      AllowFromPublic = true
    }
  ])
}

data "aws_caller_identity" "current" {}

resource "aws_opensearchserverless_access_policy" "workshop-collection-access-policy" {
  name        = "${local.prefix}-${local.project}-access-policy"
  type        = "data"
  description = "Read and Write permissions"
  policy = jsonencode([
    {
      Rules = [
        {
          ResourceType = "index",
          Resource = [
            "index/*/*"
          ],
          Permission = [
            "aoss:*"
          ]
        },
        {
          ResourceType = "collection",
          Resource = [
            "collection/genai-vectors-collection"
          ],
          Permission = [
            "aoss:*"
          ]
        }
      ],
      Principal = [
        data.aws_caller_identity.current.arn
      ]
    }
  ])
}
