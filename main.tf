data "aws_iam_policy_document" "assumeRole" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      identifiers = [var.trusted_root_account_arn]
      type        = "AWS"
    }
    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_role" "iamroleadmin" {
  name = "${lower(var.project)}${lower(var.stage)}iamroleadmin"

  # assume_role_policy aka trust relationship (policy):
  assume_role_policy = data.aws_iam_policy_document.assumeRole.json
}

data "aws_iam_policy_document" "allowAll" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iampolicyadmin" {
  name        = "${lower(var.project)}${lower(var.stage)}iampolicyadmin"
  description = "Allows administration of all resources in this account"
  policy      = data.aws_iam_policy_document.allowAll.json
}

resource "aws_iam_role_policy_attachment" "iamrolepolicyattachmentadmin" {
  role       = aws_iam_role.iamroleadmin.name
  policy_arn = aws_iam_policy.iampolicyadmin.arn
}

resource "aws_iam_group" "adminGroup" {
  name = "${lower(var.project)}${lower(var.stage)}iamgroupadmin"
}

data "aws_iam_policy_document" "assumeRoleForAdmin" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.iamroleadmin.arn]
  }
}

resource "aws_iam_policy" "assumeRoleForAdmin" {
  policy = data.aws_iam_policy_document.assumeRoleForAdmin.json
}

resource "aws_iam_group_policy_attachment" "assumeRoleForAdmin" {
  group      = aws_iam_group.adminGroup.name
  policy_arn = aws_iam_policy.assumeRoleForAdmin.arn
}
