# #!/bin/bash

# USERIDI=$(id -u)


# VALIDATE(){
#     if [ $1 -ne 0 ]
#     then
#         echo "$2 is failed"
#         exit 1
#     else
#         echo "$2 is success"
#     fi
# }
# if [ $USERIDI -ne 0 ]
# then
#     echo "You must need to have root access for installing"
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     dnf install mysql -y
#     VALIDATE $? "Installing Mysql..."
# else
#     echo "mysql is already installed"
# fi

# dnf list installed git
# if [ $? -ne 0 ]
# then
#     dnf install git -y
#     VALIDATE $? "Installing git..."
# else
#     echo "git is already installed"
# fi

# ---

#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "need sudo access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is success"
    fi
}

dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    VALIDATE $? "installing nginx"
else
    echo "already installed"
fi