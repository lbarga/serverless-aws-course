# 1. create the policy security files.

# 2. create security role with IAM
aws iam create-role --role-name lambda-example --assume-role-policy-document file://policies.json | tee logs/role.log

# 3. create project and zip 
aws lambda create-function --function-name hello-cli --zip-file fileb://index.zip --handler index.handler --runtime nodejs12.x --role arn:aws:iam::215785215210:role/lambda-example | tee logs/lambda-create.log

# 4. invoke lambda!
aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec.log
# you can see the result in logs/lambda-exec.log

# 5. zip and update

# 6. update lambda
aws lambda update-function-code --zip-file fileb://index.zip --function-name hello-cli --publish | tee logs/lambda-update.log

# 7. invoke again! new result!
aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec-update.log

# 8. remove everything
aws lambda delete-function --function-name hello-cli

aws iam delete-role --role-name lambda-example