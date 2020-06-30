resource "aws_iam_policy" "policy" {
  name = "iam_for_lambda"
  

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1593508295780",
      "Action": "lambda:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "lambda_role" {
    name = "lambda_role"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF



}

locals{
    lambda_zip_location = "outputs/welcome.zip"
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "Lambda/welcome.py"
  output_path = "${local.lambda_zip_location}"
}


resource "aws_lambda_function" "test_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "welcome"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "welcome.hello"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"

  runtime = "python3.8"

}
