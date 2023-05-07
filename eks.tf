data "aws_iam_policy_document" "platform_eks" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "platform_eks" {
  name               = "platform_eks"
  assume_role_policy = data.aws_iam_policy_document.platform_eks.json
}

resource "aws_iam_role_policy_attachment" "platform_eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  role = aws_iam_role.platform_eks.name
}

resource "aws_eks_cluster" "platform" {
  name = "platform"

  role_arn = aws_iam_role.platform_eks.arn

  #   version = ""

  vpc_config {
    endpoint_private_access = false

    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.private_platform_a.id,
    #   aws_subnet.private_platform_b.id,
      aws_subnet.public_platform_a.id,
    #   aws_subnet.public_platform_b.id
    ]

  }

  depends_on = [
    aws_iam_role_policy_attachment.platform_eks
  ]
}