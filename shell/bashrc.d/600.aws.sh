# read AWS credentials using the 1password (op) tool
eval $(op signin)
export AWS_ACCESS_KEY_ID=$(op item get "AWS User" --fields label="access key")
export AWS_SECRET_ACCESS_KEY=$(op item get "AWS User" --fields label="secret key" --reveal)
export AWS_REGION="us-west-2"
