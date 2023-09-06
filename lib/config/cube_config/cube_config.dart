const String SORT_ASC = "asc";
const String SORT_DESC = "desc";

const String USER_ARG_NAME = "user";
const String DIALOG_ARG_NAME = "dialog";
const String SELECTED_USERS_ARG_NAME = "selected_users";

enum LoginType { login, email, phone, facebook }

class ListItem<T> {
  bool isSelected = false;
  T data;

  ListItem(this.data);
}
