#!/bin/bash

NUMBER=$1


#-gt,-lt,-eq,-ge,-le

if [ $NUMBER -gt 100 ]
then
    echo "Given number is greater than 100"
else
    echo "Given number is less than 100"
fi

---

#!/bin/bash

dnf list installed git
if [ $? -ne 0 ]
then
    echo "installing git"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installing is failed"
        exit 1
    else
        echo "git installed successfully"
    fi
    exit 1
else
    echo "git is already installed"
fi

---
#!/bin/bash

NUMBER=$1

if [ $NUMBER -le 50 ]
then
    echo " the given number is less than 50"
else
    echo "the given number is greater than 56"
fi

---

USER=$(id -u)
if 