# terraform_app

vpc - infrastructure for application
app - application
main - launch application

By default using s3 backend. To store state local, comment "terraform" block in vpc/main.tf and main/main.tf, change "terraform_remote_state" in main/main.tf to use terraform state from vpc module.

1. Apply VPC and save state in same directory.
2. Apply MAIN to start application.

You can change count of your environments in main/variables.tf

You will access to ypur applications by address: http://<alb_dns>/<your_app_name>/
