data "aws_iam_policy_document" "platform_eks_node_group" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "platform_eks_node_group" {
  name               = "platform_eks_node_group"
  assume_role_policy = data.aws_iam_policy_document.platform_eks_node_group.json
}

resource "aws_iam_role_policy_attachment" "platform_eks_node_group_worker_nodes" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.platform_eks_node_group.name
}


resource "aws_iam_role_policy_attachment" "platform_eks_node_group_cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  role = aws_iam_role.platform_eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "platform_eks_node_group_ecr_read" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  role = aws_iam_role.platform_eks_node_group.name
}


resource "aws_eks_node_group" "platform_eks_node_group" {

  cluster_name = aws_eks_cluster.platform.name

  node_group_name = "platform_eks_node_group"

  node_role_arn = aws_iam_role.platform_eks_node_group.arn

  subnet_ids = [
    aws_subnet.private_platform_a.id,
    # aws_subnet.private_platform_b.id
  ]

  scaling_config {
    desired_size = 1

    max_size = 1

    min_size = 1
  }

  ami_type = "AL2_x86_64"

  capacity_type = "ON_DEMAND"

  disk_size = 20

  force_update_version = false

  instance_types = ["t3.small"]

  labels = {
    role = "platform_eks_node_group"
    Name = "platform_eks_node_group"
  }

  depends_on = [
    aws_iam_role_policy_attachment.platform_eks_node_group_cni,
    aws_iam_role_policy_attachment.platform_eks_node_group_ecr_read,
    aws_iam_role_policy_attachment.platform_eks_node_group_worker_nodes
  ]

}
