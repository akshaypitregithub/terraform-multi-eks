data "tls_certificate" "eks" {
    url = aws_eks_cluster.platform.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url = aws_eks_cluster.platform.identity[0].oidc[0].issuer
}

resource "aws_iam_policy" "test-policy" {
    name = "test-policy"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = [
                "s3:*"
            ]
            Effect = "Allow"
            Resource = "arn:aws:s3:::*"
        }]
    })
  
}

resource "aws_iam_role" "test_oidc" {
    assume_role_policy = data.aws_iam_policy_document.test_oidc_assume_role_policy.json
    name = "test-oidc"
}

resource "aws_iam_role_policy_attachment" "test_attach" {
  role = aws_iam_role.test_oidc.name
  policy_arn = aws_iam_policy.test-policy.arn
}

output "test_polict_arn" {
  value = aws_iam_role.test_oidc.arn
}
