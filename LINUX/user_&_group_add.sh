function group_creation()
{
  echo "entrez le GUID du group"
  read groupeid
  groupadd -g $groupeid
}

function group_creation()
{
  echo "entrez le GUID du group"
  read groupeid
  echo "entrez l'UID du user"
  read userid
  useradd -u $userid -g $groupeid -s /bin/bash
}
