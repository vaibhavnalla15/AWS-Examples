terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# 1. Lambda Function (Updated to stable Python 3.12)
resource "aws_lambda_function" "hello" {
  function_name = "hello-api"
  runtime       = "python3.12" 
  handler       = "test.lambda_handler"
  role          = var.aws_iam_role # Ensure this role has 'lambda.amazonaws.com' trust policy

  filename         = "test.zip"
  source_code_hash = filebase64sha256("test.zip") # Forces update if zip changes
}

# 2. HTTP API Gateway
resource "aws_apigatewayv2_api" "http_api" {
  name          = "hello-http-api"
  protocol_type = "HTTP"
}

# 3. Integration
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.http_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.hello.invoke_arn
}

# 4. Route (Matches GET /hello)
resource "aws_apigatewayv2_route" "route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "GET /hello"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# 5. Stage (Auto-deploys to $default)
resource "aws_apigatewayv2_stage" "stage" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}

# 6. Permissions (Simplified ARN for reliability)
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*"
}

