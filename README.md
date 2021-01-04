# terraform_app

vpc - infrastructure for application
app - application
main - launch application

1. Apply VPC and save state in same directory.
2. Apply MAIN to start application.

You can change count of your environments in main/variables.tf

You will access to ypur applications by address: http://<alb_dns>/<your_app_name>/
