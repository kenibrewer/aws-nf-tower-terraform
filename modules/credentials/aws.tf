# Create an AWS Access Key and Secret Key for use by Nextflow Tower
#

# Create an IAM user for Nextflow Tower
resource "aws_iam_user" "nftower_user" {
  name = local.generated_aws_user_name
  path = var.aws_user_path
  tags = local.common_tags
}

# Create an IAM access key for the Nextflow Tower user
resource "aws_iam_access_key" "nftower_user" {
  user = aws_iam_user.nftower_user.name
}

resource "aws_iam_user_policy_attachment" "nftower_user" {
  user       = aws_iam_user.nftower_user.name
  policy_arn = aws_iam_policy.nftower_policy.arn
}


# Create a bucket for Nextflow Tower
resource "aws_s3_bucket" "nftower_bucket" {
  bucket = local.generated_bucket_name
  tags   = local.common_tags
}

resource "aws_iam_policy" "nftower_s3_bucket" {
  name        = local.generated_aws_bucket_policy_name
  description = "Bucket Policy for Nextflow Tower"
  path        = var.aws_user_path
  tags        = local.common_tags
  policy      = <<POLICYEOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${local.generated_bucket_name}"
            ]
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectTagging",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::${local.generated_bucket_name}/*"
            ],
            "Effect": "Allow"
        }
    ]
}
POLICYEOF
}

resource "aws_iam_user_policy_attachment" "nftower_bucket" {
  user       = aws_iam_user.nftower_user.name
  policy_arn = aws_iam_policy.nftower_s3_bucket.arn
}

# Create an IAM policy for Nextflow Tower using HEREDOC syntax
resource "aws_iam_policy" "nftower_policy" {
  name        = local.generated_aws_user_policy_name
  description = "Policy for Nextflow Tower"
  path        = var.aws_user_path
  tags        = local.common_tags
  policy      = <<POLICYEOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "TowerForge0",
          "Effect": "Allow",
          "Action": [
              "ssm:GetParameters",
              "iam:CreateInstanceProfile",
              "iam:DeleteInstanceProfile",
              "iam:GetRole",
              "iam:RemoveRoleFromInstanceProfile",
              "iam:CreateRole",
              "iam:DeleteRole",
              "iam:AttachRolePolicy",
              "iam:PutRolePolicy",
              "iam:AddRoleToInstanceProfile",
              "iam:PassRole",
              "iam:DetachRolePolicy",
              "iam:ListAttachedRolePolicies",
              "iam:DeleteRolePolicy",
              "iam:ListRolePolicies",
              "iam:TagRole",
              "iam:TagInstanceProfile",
              "batch:CreateComputeEnvironment",
              "batch:DescribeComputeEnvironments",
              "batch:CreateJobQueue",
              "batch:DescribeJobQueues",
              "batch:UpdateComputeEnvironment",
              "batch:DeleteComputeEnvironment",
              "batch:UpdateJobQueue",
              "batch:DeleteJobQueue",
              "fsx:DeleteFileSystem",
              "fsx:DescribeFileSystems",
              "fsx:CreateFileSystem",
              "fsx:TagResource",
              "ec2:DescribeSecurityGroups",
              "ec2:DescribeAccountAttributes",
              "ec2:DescribeSubnets",
              "ec2:DescribeLaunchTemplates",
              "ec2:DescribeLaunchTemplateVersions", 
              "ec2:CreateLaunchTemplate",
              "ec2:DeleteLaunchTemplate",
              "ec2:DescribeKeyPairs",
              "ec2:DescribeVpcs",
              "ec2:DescribeInstanceTypeOfferings",
              "ec2:GetEbsEncryptionByDefault",
              "elasticfilesystem:DescribeMountTargets",
              "elasticfilesystem:CreateMountTarget",
              "elasticfilesystem:CreateFileSystem",
              "elasticfilesystem:DescribeFileSystems",
              "elasticfilesystem:DeleteMountTarget",
              "elasticfilesystem:DeleteFileSystem",
              "elasticfilesystem:UpdateFileSystem",
              "elasticfilesystem:PutLifecycleConfiguration",
              "elasticfilesystem:TagResource"
          ],
          "Resource": "*"
      },
      {
          "Sid": "TowerLaunch0",
          "Effect": "Allow",
          "Action": [
              "s3:Get*",
              "s3:List*",
              "batch:DescribeJobQueues",
              "batch:CancelJob",
              "batch:SubmitJob",
              "batch:ListJobs",
              "batch:TagResource",
              "batch:DescribeComputeEnvironments",
              "batch:TerminateJob",
              "batch:DescribeJobs",
              "batch:RegisterJobDefinition",
              "batch:DescribeJobDefinitions",
              "ecs:DescribeTasks",
              "ec2:DescribeInstances",
              "ec2:DescribeInstanceTypes",
              "ec2:DescribeInstanceAttribute",
              "ecs:DescribeContainerInstances",
              "ec2:DescribeInstanceStatus",
              "ec2:DescribeImages",
              "logs:Describe*",
              "logs:Get*",
              "logs:List*",
              "logs:StartQuery",
              "logs:StopQuery",
              "logs:TestMetricFilter",
              "logs:FilterLogEvents",
              "ses:SendRawEmail"
          ],
          "Resource": "*"
      }
  ]
}
POLICYEOF
}