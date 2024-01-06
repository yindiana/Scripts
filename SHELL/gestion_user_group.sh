function group_creation()
{
  echo "entrez le GUID du group"
  read groupeid
  echo "entrez le nom du groupe a créer"
  read groupname
  groupadd -g $groupeid $groupname
}

function user_creation()
{
  echo "entrez le GUID du group"
  read groupeid
  echo "entrez l'UID du user"
  read userid
  echo "entrez le nom du user a créer"
  read username
  useradd -u $userid -g $groupeid -s /bin/bash $username
}

function group_del()
{
  echo "entrez le nom du groupe a supprimer"
  read groupname
  groupdel $groupname
}

function user_del()
{
  echo "entrez le nom du user a supprimer"
  read username
  userdel $username
}


group_creation
user_creation
