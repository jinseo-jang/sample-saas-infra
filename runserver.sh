#yum install -y git
python3 -m ensurepip
git clone https://github.com/jinseo-jang/sample-saas-backend-users.git
cd sample-saas-backend-users/
python3 -m venv ./venv
source venv/bin/activate
pip3 install -r requirements.txt


export DB_HOST=$(aws ssm get-parameter --name /saas-boost-lab/db/dbhost --with-decryption --output text --query Parameter.Value)
export DB_NAME=$(aws ssm get-parameter --name /saas-boost-lab/db/dbname --with-decryption --output text --query Parameter.Value)
export DB_USER=$(aws ssm get-parameter --name /saas-boost-lab/db/dbuser --with-decryption --output text --query Parameter.Value)
export DB_PWD=$(aws ssm get-parameter --name /saas-boost-lab/db/dbpwd --with-decryption --output text --query Parameter.Value)

nohup python app.py > log.txt 2>&1 &