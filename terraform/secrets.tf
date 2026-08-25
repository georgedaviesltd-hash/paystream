resource "aws_secretsmanager_secret" "app_secrets" {
  name                    = "paystream/production/secrets"
  recovery_window_in_days = 0
  description             = "Decoupled runtime variables for the PayStream system"
}

resource "aws_secretsmanager_secret_version" "initial_placeholder" {
  secret_id     = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    NOTIFICATION_SERVICE_URL = "placeholder"
  })
}
